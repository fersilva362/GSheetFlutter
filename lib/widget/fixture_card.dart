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
                padding: EdgeInsets.only(left: 10, right: 10),
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
                Container(
                  padding: const EdgeInsets.only(
                      top: 5, left: 5, right: 5, bottom: 10),
                  width: 200,
                  height: 75,
                  //color: AppConstant.APP_BLACK,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(child: Container()),
                      Container(
                        width: 120,
                        child: Text(
                          players1.split(re).join('  ').toUpperCase(),
                          maxLines: 3,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/logo_players1.png'))),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    // height: 50,
                    width: 50,
                    //  color: AppConstant.APP_BLACK,
                    child: Center(
                      child: Text(
                        (date == 'Next Match') ? 'vs' : '$goalsT1 - $goalsT2',
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                      top: 5, left: 5, right: 5, bottom: 10),
                  width: 200,
                  // height: 50,
                  // color: AppConstant.APP_BLACK,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/logo_players2.png'))),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 120,
                        child: Text(
                          players2.split(re).join('  ').toUpperCase(),
                          maxLines: 3,
                        ),
                      ),
                      Expanded(child: Container()),
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
