class MatchSoccer {
  String? date;
  String? players1;
  String? players2;
  int? goalsT1;
  int? goalsT2;

  MatchSoccer({
    this.date,
    this.players1,
    this.players2,
    this.goalsT1,
    this.goalsT2,
  });

  MatchSoccer.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    players1 = json['players_1'];
    players2 = json['players_2'];
    goalsT1 = json['goals_T1'];
    goalsT2 = json['goals_T2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['players_1'] = players1;
    data['players_2'] = players2;
    data['goals_T1'] = goalsT1;
    data['goals_T2'] = goalsT2;
    return data;
  }

  @override
  String toString() {
    return '{date: $date, players1: $players1, players2: $players2, goalsT1:$goalsT1, goalsT2:$goalsT2}';
  }
}
