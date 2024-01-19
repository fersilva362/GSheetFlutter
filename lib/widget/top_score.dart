import 'package:flutter/material.dart';
import 'package:match_flutter/constants/constant.dart';
import 'package:match_flutter/constants/dimension.dart';

class TopScores extends StatelessWidget {
  final String name;
  final int match;
  final int score;
  final int index;
  const TopScores(
      {super.key,
      required this.name,
      required this.match,
      required this.score,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          AppConstant.APP_BLACK,
          AppConstant.APP_BLACK,
          AppConstant.APP_RED
        ], begin: Alignment.centerLeft, end: Alignment.topRight),
        boxShadow: [
          BoxShadow(
            offset: Offset(2, 2),
            blurRadius: 1,
            color: AppConstant.APP_SHADOW,
          ),
        ],
        /* borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50), bottomLeft: Radius.circular(50)) */
      ),
      width: 150,
      height: 60,
      margin: const EdgeInsets.only(
          left: AppDimension.APP_P20,
          right: AppDimension.APP_P20,
          top: 10,
          bottom: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                width: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: AppDimension.APP_P10 / 2,
                    bottom: AppDimension.APP_P10 / 2,
                    right: AppDimension.APP_P10,
                    left: AppDimension.APP_P10),
                /* child info */
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name.toUpperCase(),
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${match.toString()} match played',
                      style: const TextStyle(fontSize: 10),
                    ),
                    Text(
                      'scoring goals: ${score.toString()} (neat goals)',
                      style: const TextStyle(fontSize: 10),
                    )
                  ],
                ),
              ),
              /* const SizedBox(
                width: 50,
              ), */
              Container(
                width: 60,
                height: 60,
                decoration: const BoxDecoration(
                  color: AppConstant.APP_GREEN,
                ),
                child: Center(
                  child: Text(
                    '# ${index.toString()}',
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
