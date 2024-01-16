import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:match_flutter/constants/routes_helper.dart';
import 'package:match_flutter/controllers/matches_soccer_controller.dart';
import 'package:match_flutter/widget/fixture_card.dart';

class MatchPage extends StatelessWidget {
  const MatchPage({super.key});

  @override
  Widget build(BuildContext context) {
    var arg = (Get.arguments ?? {}) as Map;
    if (arg.isNotEmpty) {
      arg.removeWhere((_, value) => !value);
    }

    return Scaffold(
      body: Column(
        children: [
          GetBuilder<TotalMatchController>(
            builder: (controller) {
              List playersInTeams = controller.getTeamsOfPlyers(arg);

              String equipo1 = controller.teamToString(controller.team1);
              String equipo2 = controller.teamToString(controller.team2);

              if (equipo1.length > equipo2.length) {
                equipo2 = '$equipo2 VACANTE';
              }
              return playersInTeams.isNotEmpty
                  ? Container(
                      padding:
                          const EdgeInsets.only(top: 10, left: 10, right: 10),
                      height: 600,
                      child: FixtureMatch(
                          date: 'Next Match',
                          players1: equipo1,
                          players2: equipo2,
                          goalsT1: 0,
                          goalsT2: 0))
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircularProgressIndicator(),
                        TextButton(
                            onPressed: () => Get.toNamed(RoutesHelper.initial),
                            child: const Text('Go to Homepage'))
                      ],
                    );
            },
          ),
        ],
      ),
    );
  }
}
