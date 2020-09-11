class LearnerCoverter {
  final String name;
  final int hours;
  final String badgeurl;
  final String country;

  LearnerCoverter({this.name, this.badgeurl, this.hours, this.country});

  factory LearnerCoverter.fromJson(Map json) {
    return new LearnerCoverter(
      name: json["name"],
      badgeurl: json["badgeUrl"],
      hours: json["hours"],
      country: json["country"],
    );
  }
}

class SkillCoverter {
  final String name;
  final int score;
  final String badgeurl;
  final String country;

  SkillCoverter({this.name, this.badgeurl, this.score, this.country});

  factory SkillCoverter.fromJson(Map json) {
    return new SkillCoverter(
      name: json["name"],
      badgeurl: json["badgeUrl"],
      score: json["score"],
      country: json["country"],
    );
  }
}
