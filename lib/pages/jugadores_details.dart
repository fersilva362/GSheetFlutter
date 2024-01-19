import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:match_flutter/constants/constant.dart';
import 'package:match_flutter/constants/dimension.dart';
import 'package:match_flutter/constants/routes_helper.dart';
import 'package:match_flutter/controllers/matches_soccer_controller.dart';
import 'package:adaptive_navbar/adaptive_navbar.dart';
import 'package:match_flutter/widget/top_score.dart';

class Jugadores extends StatelessWidget {
  const Jugadores({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TotalMatchController>();
    List<dynamic> jugadores = controller.getScore();
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
            text: 'Squad builder',
            onTap: () => Get.toNamed(RoutesHelper.armador),
          )
        ],
      ),
      body: Column(
        children: [
          GetBuilder<TotalMatchController>(
            builder: (_) {
              return Center(
                child: Container(
                    color: Colors.transparent,
                    margin: const EdgeInsets.only(
                        left: AppDimension.APP_P20,
                        right: AppDimension.APP_P20,
                        top: AppDimension.APP_P20 * 3),
                    height: AppDimension.APP_HEIGHT200 * 3 / 2,
                    width: AppDimension.APP_SCREEN_WIDTH,
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
              );
            },
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: AppDimension.APP_HEIGHT60 * 2 / 3,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppConstant.APP_BUTTON_COLOR),
                onPressed: () => Get.toNamed(RoutesHelper.armador),
                child: const Text('I Want To Play')),
          )
        ],
      ),
    );
  }
}
