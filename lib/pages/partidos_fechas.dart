import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:match_flutter/constants/dimension.dart';
import 'package:match_flutter/constants/routes_helper.dart';
import 'package:match_flutter/controllers/matches_soccer_controller.dart';
import 'package:match_flutter/models/model_match.dart';
import 'package:match_flutter/widget/fixture_card.dart';
import 'package:adaptive_navbar/adaptive_navbar.dart';

class Partidos extends StatelessWidget {
  const Partidos({super.key});

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;

    return GetBuilder<TotalMatchController>(builder: (controller) {
      List<dynamic> allMatchesPlayed = controller.totalMatches;
      return Scaffold(
          appBar: AdaptiveNavBar(
            title: const Text('HayEquipo'),
            screenWidth: sw,
            navBarItems: [
              NavBarItem(
                text: 'Match Results',
                onTap: () => Get.toNamed(RoutesHelper.initial),
              ),
              NavBarItem(
                text: 'Players',
                onTap: () => Get.toNamed(RoutesHelper.jugadores),
              ),
            ],
          ),
          body: Center(
            child: controller.isLoaded
                ? Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Match Results',
                        style: TextStyle(fontSize: 22),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            top: AppDimension.APP_P20,
                            left: AppDimension.APP_P10,
                            right: AppDimension.APP_P10,
                            bottom: AppDimension.APP_P20),
                        height: AppDimension.APP_HEIGHT600,
                        width: AppDimension.APP_SCREEN_WIDTH,
                        child: ListView.builder(
                          itemCount: allMatchesPlayed.length,
                          itemBuilder: (context, index) {
                            MatchSoccer match = allMatchesPlayed[index];

                            return FixtureMatch(
                                date: match.date!,
                                players1: match.players1!,
                                players2: match.players2!,
                                goalsT1: match.goalsT1!,
                                goalsT2: match.goalsT2!);
                          },
                        ),
                      ),
                    ],
                  )
                : const CircularProgressIndicator(),
          ));
    });
  }
}
