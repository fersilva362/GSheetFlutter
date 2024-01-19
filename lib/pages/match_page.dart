import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:match_flutter/constants/constant.dart';
import 'package:match_flutter/constants/dimension.dart';
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
      body: SizedBox(
        width: double.maxFinite,
        height: 700,
        child: GetBuilder<TotalMatchController>(
          builder: (controller) {
            List playersInTeams = controller.getTeamsOfPlyers(arg);

            String equipo1 = controller.teamToString(controller.team1);
            String equipo2 = controller.teamToString(controller.team2);

            if (controller.team1.length > controller.team2.length) {
              equipo2 = '$equipo2 #VACANTE';
            }

            return Center(
              child: SizedBox(
                height: AppDimension.APP_HEIGHT600,
                width: AppDimension.APP_SCREEN_WIDTH,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    playersInTeams.isNotEmpty
                        ? Container(
                            padding: const EdgeInsets.only(
                                top: 10, left: 10, right: 10),
                            height: 260,
                            child: FixtureMatch(
                                date: 'Next Match',
                                players1: equipo1,
                                players2: equipo2,
                                goalsT1: 0,
                                goalsT2: 0))
                        : const Column(
                            children: [
                              CircularProgressIndicator(),
                              Text('Ooops, you forgot to tilt the players'),
                              SizedBox(
                                height: 10,
                              )
                            ],
                          ),
                    const SizedBox(
                      height: AppDimension.APP_HEIGHT60 / 3,
                    ),
                    SizedBox(
                      height: AppDimension.APP_HEIGHT60 * 2 / 3,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppConstant.APP_BUTTON_COLOR),
                          onPressed: () => Get.toNamed(RoutesHelper.initial),
                          child: const Text('Back to Fixture')),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
