import 'package:flutter/material.dart';
import 'package:match_flutter/constants/constant.dart';

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
          boxShadow: [
            BoxShadow(
                offset: Offset(1, 1),
                blurRadius: 3,
                color: Color.fromARGB(255, 230, 230, 230))
          ],
          color: Colors.black,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50), bottomLeft: Radius.circular(50))),
      width: 300,
      height: 50,
      margin: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 5, bottom: 5, right: 10, left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name.toUpperCase(),
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${match.toString()} partidos jugados',
                      style: const TextStyle(fontSize: 10),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 50,
              ),
              Container(
                width: 100,
                height: 50,
                decoration: BoxDecoration(
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
