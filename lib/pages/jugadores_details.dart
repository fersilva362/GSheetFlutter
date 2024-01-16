import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:match_flutter/constants/routes_helper.dart';
import 'package:match_flutter/controllers/matches_soccer_controller.dart';
import 'package:adaptive_navbar/adaptive_navbar.dart';
import 'package:match_flutter/widget/top_score.dart';

class Jugadores extends StatelessWidget {
  const Jugadores({super.key});

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AdaptiveNavBar(
        title: Text('TOP SCORES'),
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
      body: GetBuilder<TotalMatchController>(
        builder: (controller) {
          List<dynamic> jugadores = controller.getScore();

          return Column(
            children: [
              Center(
                child: Container(
                    margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
                    height: 700 * 0.9,
                    child: ListView.builder(
                      itemCount: jugadores.length,
                      itemBuilder: (context, index) {
                        final name = jugadores[index]['name'];
                        final match = jugadores[index]['match'];
                        final goals = jugadores[index]['goals'];
                        final int score = (goals / match).round();

                        return TopScores(
                          name: name,
                          match: match,
                          score: score,
                          index: index + 1,
                        );
                      },
                    )),
              ),
            ],
          );
        },
      ),
    );
  }
}
