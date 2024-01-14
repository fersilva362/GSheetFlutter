import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:match_flutter/constants/routes_helper.dart';
import 'package:match_flutter/controllers/matches_soccer_controller.dart';

class Armador extends StatefulWidget {
  const Armador({super.key});

  @override
  State<Armador> createState() => _ArmadorState();
}

class _ArmadorState extends State<Armador> {
  @override
  late Map<String, bool> _days;
  late TextEditingController _textEditingController;

  // List<String> dayKeys = [];
  void initState() {
    // TODO: implement initState
    super.initState();
    _days = Get.find<TotalMatchController>().getAttendantPlayers();
    _textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final days = _days;
    List<String> dayKeys = [];
    return Scaffold(
      body: Column(
        children: [
          Column(
            children: [
              TextFormField(
                controller: _textEditingController,
                decoration: const InputDecoration(
                  hintText: 'I wanna play!',
                  labelText: 'Name *',
                ),
              ),
              TextButton(
                  onPressed: () {
                    setState(() {
                      days.putIfAbsent(
                          _textEditingController.text, () => false);
                    });
                  },
                  child: const Text('Send'))
            ],
          ),
          GetBuilder<TotalMatchController>(
            builder: (controller) {
              dayKeys.addAll(days.keys);
              return Column(
                children: [
                  TextButton(
                      onPressed: () => Get.toNamed(RoutesHelper.initial),
                      child: Text('go to partido')),
                  Container(
                    height: 500,
                    child: ListView.builder(
                      itemCount: days.length,
                      itemBuilder: (context, index) {
                        String key = dayKeys[index];
                        return CheckboxListTile.adaptive(
                          value: days[key],
                          onChanged: (value) => setState(() {
                            days[key] = value!;
                          }),
                          title: Text(key),
                        );
                      },
                    ),
                  ),
                  Text('Armador de equipo'),
                  TextButton(
                    onPressed: () {
                      Get.toNamed(RoutesHelper.jugadores);
                    },
                    child: Text('back to jugadores'),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.toNamed(RoutesHelper.hayEquipo, arguments: days);
                    },
                    child: Text('go to Hay equipo'),
                  )
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
