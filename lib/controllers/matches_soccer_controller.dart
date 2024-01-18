// ignore_for_file: prefer_interpolation_to_compose_strings, no_leading_underscores_for_local_identifiers, unused_local_variable

import 'dart:convert';
import 'package:get/get.dart';
import 'package:match_flutter/models/model_match.dart';
import 'package:match_flutter/repositories/matches_soccer_repo.dart';

class TotalMatchController extends GetxController {
  final TotalMatchRepo matchRepo;
  TotalMatchController({required this.matchRepo});

  List _totalMatches = [];
  List<dynamic> get totalMatches => _totalMatches;
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  List _playersSoccer = [];
  List get playersSoccer => _playersSoccer;
  bool _isPlayersSoccer = false;
  bool get isPlayersSoccer => _isPlayersSoccer;
  Map<String, bool> _bag = {};
  Map get bag => _bag;

  List _team1 = [];
  List _team2 = [];
  List get team1 => _team1;
  List get team2 => _team2;

  Future<void> getAllMatches() async {
    final response = await matchRepo.getAllMatches();
    _isLoaded = true;
    final List dataMatch = response
        .split('\n')
        .sublist(
          1,
        )
        .map(
      (e) {
        return e.split('\t');
      },
    ).map((rowTab) {
      var obj = {};
      final [date, players_1, players_2, goalsT_1, goalsT_2] = rowTab;

      obj['date'] = date;
      obj['players_1'] = players_1;
      obj['players_2'] = players_2;
      obj['goals_T1'] = int.parse(goalsT_1);
      obj['goals_T2'] = int.parse(goalsT_2);
      return obj;
    }).toList();
    //!Great
    final rawData = dataMatch
        .map(
          (e) => MatchSoccer.fromJson(jsonDecode(jsonEncode(e))),
        )
        .toList();

    _totalMatches = [];
    _totalMatches.addAll(rawData);
    update();
  }

  List getScore() {
    _isPlayersSoccer = true;
    var bag = <String, dynamic>{};
    final scorePlayer = _totalMatches.map((e) {
      var players1 = e.players1.split(',');
      for (var name in players1) {
        name = name.trim();
        bag.putIfAbsent(name, () => ({'name': name, 'match': 0, 'goals': 0}));
        if (bag.containsKey(name)) {
          bag.update(name, (v) {
            v['match'] += 1;
            v['goals'] += (e.goalsT1 - e.goalsT2);
            return v;
          });
        }
      }
      var players2 = e.players2.split(',');

      for (var name in players2) {
        name = name.trim();
        bag.putIfAbsent(name, () => ({'name': name, 'match': 0, 'goals': 0}));
        if (bag.containsKey(name)) {
          bag.update(name, (v) {
            v['match'] += 1;
            v['goals'] += (e.goalsT2 - e.goalsT1);
            return v;
          });
        }
      }
      return bag;
    }).toList();
    var jugadores = [];
    bag.forEach((k, v) => jugadores.add(v));
    _playersSoccer
        .addAll(jugadores..sort((a, b) => b['goals'].compareTo(a['goals'])));

    return jugadores..sort((a, b) => b['goals'].compareTo(a['goals']));
  }

  Map<String, bool> getAttendantPlayers() {
    _bag = {};
    for (var elemento in _playersSoccer) {
      _bag.putIfAbsent(elemento['name'], () => false);
    }

    return _bag;
  }

  List getTeamsOfPlyers(Map days) {
    var array = [];
    List baggy = [];
    _team1 = [];
    _team2 = [];

    array.addAll(days.keys);

    for (var attender in array) {
      final firstPlayer = _playersSoccer
          .where((element) => element['name'] == attender)
          .toList();
      if (firstPlayer.isEmpty) {
      } else {
        baggy.add(firstPlayer);
      }
    }

    final baggyCompact = baggy.expand((element) => element).toList();
    var bag1 = [];
    for (var item in array) {
      final draft = baggyCompact.where((obj) => obj['name'] == item);
      if (draft.isNotEmpty) {
      } else {
        bag1.add({'name': item, 'match': 0, 'goals': 0});
      }
    }
    baggy.add(bag1);
    _playersSoccer = [];

    final newDataPlayer = baggy.expand((element) => element).toList()
      ..sort(
        (a, b) => b['goals'].compareTo(a['goals']),
      );
    for (var player in newDataPlayer) {
      if (_team1.length > _team2.length) {
        _team2.add(player);
      } else {
        _team1.add(player);
      }
    }

    return newDataPlayer;
  }

  String teamToString(team) {
    var _team = team;
    var str = _team.map((e) => e['name']).toList();
    var _strTeam = '';
    for (var word in str) {
      _strTeam = _strTeam + ' ' + word;
    }
    return _strTeam;
  }
}
