import 'package:flutter/material.dart';
import 'package:flutter_bootstrap5/flutter_bootstrap5.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:match_flutter/constants/routes_helper.dart';
import 'package:match_flutter/controllers/matches_soccer_controller.dart';

class Jugadores extends StatelessWidget {
  const Jugadores({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<TotalMatchController>(
        builder: (controller) {
          List<dynamic> jugadores = controller.getScore();

          return Column(
            children: [
              TextButton(
                  onPressed: () => Get.toNamed(RoutesHelper.armador),
                  child: Text('go to armador')),
              Column(
                children: [
                  Table(
                    children: const [
                      TableRow(children: [
                        TableCell(child: Text('Name')),
                        TableCell(child: Text('Matches played')),
                        TableCell(child: Text('Goals')),
                        TableCell(child: Text('Rank')),
                      ])
                    ],
                  ),
                  Table(
                      border: TableBorder.all(),
                      children: jugadores.map((obj) {
                        final name = obj['name'];
                        final match = obj['match'];
                        final goals = obj['goals'];
                        final score = goals / match;
                        return TableRow(
                          children: [
                            TableCell(
                              child: Text(name),
                            ),
                            TableCell(
                              child: Text(match.toString()),
                            ),
                            TableCell(
                              child: Text(goals.toString()),
                            ),
                            TableCell(
                              child: Text(score.toString()),
                            ),
                          ],
                        );
                      }).toList()),
                ],
              ),
              TextButton(
                  onPressed: () => Get.toNamed(RoutesHelper.initial),
                  child: Text('back to partidos'))
            ],
          );
        },
      ),
    );
  }
}
