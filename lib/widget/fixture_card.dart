import 'package:flutter/material.dart';

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
      height: 100,
      width: double.maxFinite,
      child: Column(
        children: [
          //top
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 148, 190, 31),
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
              boxShadow: [
                BoxShadow(
                    offset: Offset(1, 1),
                    blurRadius: 3,
                    color: Color.fromARGB(255, 230, 230, 230))
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.only(
                      top: 5, left: 5, right: 5, bottom: 10),
                  width: 200,
                  height: 50,
                  color: Colors.black,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(child: Container()),
                      Text(players1.split(re).join('  ').toUpperCase()),
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
                    height: 50,
                    width: 50,
                    color: Colors.black,
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
                  height: 50,
                  color: Colors.black,
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
                      Text(players2.split(re).join('  ').toUpperCase()),
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
