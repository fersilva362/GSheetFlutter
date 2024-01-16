import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:match_flutter/constants/routes_helper.dart';
import 'package:match_flutter/controllers/matches_soccer_controller.dart';
import 'package:adaptive_navbar/adaptive_navbar.dart';

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
    final sw = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AdaptiveNavBar(
        title: Text('QUIERO JUGAR EQUIPO'),
        screenWidth: sw,
        navBarItems: [
          NavBarItem(
            text: 'Partidos',
            onTap: () => Get.toNamed(RoutesHelper.initial),
          ),
          NavBarItem(
            text: 'Jugadores',
            onTap: () => Get.toNamed(RoutesHelper.jugadores),
          ),
          NavBarItem(
            text: 'Hay equipo?',
            onTap: () => Get.toNamed(RoutesHelper.armador),
          )
        ],
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Column(
          children: [
            Column(
              children: [
                TextFormField(
                  controller: _textEditingController,
                  decoration: const InputDecoration(
                    hintText: 'I wanna play!',
                    labelText: 'Add new Player',
                  ),
                ),
                TextButton(
                    onPressed: () {
                      setState(() {
                        days.putIfAbsent(
                            _textEditingController.text, () => false);
                      });
                    },
                    child: const Text('ADD'))
              ],
            ),
            GetBuilder<TotalMatchController>(
              builder: (controller) {
                dayKeys.addAll(days.keys);
                return Column(
                  children: [
                    Container(
                      height: 300,
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
                    Text('ARMAR EQUIPO'),
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
      ),
    );
  }
}
