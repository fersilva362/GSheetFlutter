import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
          title: Text('FUTBOL CON AMIGOS'),
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
        body: controller.isLoaded
            ? Container(
                padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                height: 600,
                child: ListView.builder(
                  itemCount: allMatchesPlayed.length,
                  itemBuilder: (context, index) {
                    MatchSoccer match = allMatchesPlayed[index];
                    print(index);

                    return FixtureMatch(
                        date: match.date!,
                        players1: match.players1!,
                        players2: match.players2!,
                        goalsT1: match.goalsT1!,
                        goalsT2: match.goalsT2!);
                  },
                ),
              )
            : const CircularProgressIndicator(),
      );
    });
  }

  /* @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: /*
     */);
  } */
}
