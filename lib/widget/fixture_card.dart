import 'package:flutter/material.dart';
import 'package:match_flutter/constants/constant.dart';

class FixtureMatch extends StatelessWidget {
  final String date;
  final String players1;
  final String players2;
  final int goalsT1;
  final int goalsT2;
  const FixtureMatch(
      {super.key,
      required this.date,
      required this.players1,
      required this.players2,
      required this.goalsT1,
      required this.goalsT2});

  @override
  Widget build(BuildContext context) {
    final re = RegExp(r',\s*');
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: 120,
      width: double.maxFinite,
      child: Column(
        children: [
          //top
          Row(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                decoration: const BoxDecoration(
                    color: AppConstant.APP_GREEN,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
                width: 150,
                height: 25,
                child: Center(
                  child: Text(
                    date,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -1),
                  ),
                ),
              ),
              Expanded(
                  child: Container(
                height: 35,
              ))
            ],
          ),
          //info
          Container(
            decoration: const BoxDecoration(
              color: AppConstant.APP_BLACK,
              boxShadow: [
                BoxShadow(
                  offset: Offset(1, 1),
                  blurRadius: 3,
                  color: AppConstant.APP_SHADOW,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //player 1
                Container(
                  padding: const EdgeInsets.only(
                      top: 5, left: 5, right: 5, bottom: 10),
                  // width: 200,
                  height: 75,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //text player1
                      Container(
                        padding: const EdgeInsets.only(left: 10),
                        // width: 120,
                        child: Center(
                          child: Text(
                            players1.split(re).join('  ').toUpperCase(),
                            maxLines: 3,
                          ),
                        ),
                      ),
                      //blank
                      const SizedBox(
                        width: 10,
                      ),
                      //image
                      Container(
                        width: 45,
                        height: 45,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/logo_players1.png'),
                                fit: BoxFit.contain)),
                      )
                    ],
                  ),
                ),
                //marcador
                Expanded(
                  child: SizedBox(
                    width: 50,
                    child: Center(
                      child: Text(
                        (date == 'Next Match') ? 'vs' : '$goalsT1 - $goalsT2',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ),
                // player 2
                Container(
                  padding: const EdgeInsets.only(
                      top: 5, left: 5, right: 5, bottom: 10),
                  // width: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //logo team 2
                      Container(
                        width: 45,
                        height: 45,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/logo_players2.png'),
                                fit: BoxFit.contain)),
                      ),
                      //blank space
                      const SizedBox(
                        width: 10,
                      ),
                      //text player2
                      Container(
                        padding: const EdgeInsets.only(right: 10),
                        //width: 120,
                        child: Center(
                          child: Text(
                            players2.split(re).join('  ').toUpperCase(),
                            maxLines: 3,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
