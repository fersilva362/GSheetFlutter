import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:match_flutter/constants/constant.dart';
import 'package:match_flutter/constants/dimension.dart';
import 'package:match_flutter/constants/routes_helper.dart';
import 'package:match_flutter/controllers/matches_soccer_controller.dart';
import 'package:adaptive_navbar/adaptive_navbar.dart';

class Armador extends StatefulWidget {
  const Armador({super.key});

  @override
  State<Armador> createState() => _ArmadorState();
}

class _ArmadorState extends State<Armador> {
  late Map<String, bool> _days;

  late TextEditingController _textEditingController;
  @override
  void initState() {
    super.initState();
    _days = Get.find<TotalMatchController>().getAttendantPlayers();

    _textEditingController = TextEditingController();
  }

  @override
  void dispose() {
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
        title: const Text('FUTBOL ENTRE AMIGOS'),
        screenWidth: sw,
        navBarItems: [
          NavBarItem(
            text: 'Matchs',
            onTap: () => Get.toNamed(RoutesHelper.initial),
          ),
          NavBarItem(
            text: 'Players',
            onTap: () => Get.toNamed(RoutesHelper.jugadores),
          ),
          NavBarItem(
            text: 'Squads builder',
            onTap: () => Get.toNamed(RoutesHelper.armador),
          )
        ],
      ),
      body: Center(
        child: Container(
          height: AppDimension.APP_HEIGHT600,
          width: AppDimension.APP_SCREEN_WIDTH,
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
                      SizedBox(
                        height: AppDimension.APP_HEIGHT200 * 2,
                        child: ListView.builder(
                          itemCount: days.length,
                          itemBuilder: (context, index) {
                            String key = dayKeys[index];
                            return CheckboxListTile.adaptive(
                              activeColor: AppConstant.APP_GREEN,
                              value: days[key],
                              onChanged: (value) => setState(() {
                                days[key] = value!;
                              }),
                              title: Text(key.toUpperCase()),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: AppDimension.APP_HEIGHT60 * 2 / 3,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppConstant.APP_BUTTON_COLOR),
                            onPressed: () => Get.toNamed(RoutesHelper.hayEquipo,
                                arguments: days),
                            child: const Text('Get Soccer Teams')),
                      )
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
