import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:match_flutter/constants/routes_helper.dart';
import 'package:match_flutter/controllers/matches_soccer_controller.dart';

class MatchPage extends StatelessWidget {
  const MatchPage({super.key});

  @override
  Widget build(BuildContext context) {
    var arg = (Get.arguments ?? {}) as Map;
    if (arg.isNotEmpty) {
      arg.removeWhere((_, value) => !value);
    }

    return Scaffold(
      body: GetBuilder<TotalMatchController>(
        builder: (controller) {
          List playersInTeams = controller.getTeamsOfPlyers(arg);

          Map team1 = controller.team1.asMap();
          Map team2 = controller.team2.asMap();
          List ArrGhost =
              List.generate(max(team1.length, team2.length), (index) => index);

          return Column(
            children: [
              Text(playersInTeams.isEmpty ? 'isEmpty' : 'Hay Equipo'),
              Table(
                children: const [
                  TableRow(children: [
                    TableCell(child: Text('Goliat\'s Team')),
                    TableCell(child: Text('David\'s Team')),
                  ])
                ],
              ),
              Table(
                border: TableBorder.all(),
                children: ArrGhost.map((idx) {
                  return TableRow(
                    children: [
                      TableCell(child: Text(team1[idx]?['name'] ?? 'vacante')),
                      TableCell(child: Text(team2[idx]?['name'] ?? 'vacante')),
                    ],
                  );
                }).toList(),
              ),
              TextButton(
                onPressed: () {
                  Get.toNamed(RoutesHelper.initial);
                },
                child: Text('inicio'),
              )
            ],
          );
        },
      ),
    );
  }
}
