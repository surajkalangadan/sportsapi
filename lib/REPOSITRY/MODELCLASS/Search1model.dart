class Search1model {
  Search1model({
      this.data, 
      this.meta,});

  Search1model.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }
  List<Data>? data;
  Meta? meta;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    if (meta != null) {
      map['meta'] = meta?.toJson();
    }
    return map;
  }

}

class Meta {
  Meta({
      this.currentPage, 
      this.from, 
      this.perPage, 
      this.to,});

  Meta.fromJson(dynamic json) {
    currentPage = json['current_page'];
    from = json['from'];
    perPage = json['per_page'];
    to = json['to'];
  }
  int? currentPage;
  int? from;
  int? perPage;
  int? to;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['current_page'] = currentPage;
    map['from'] = from;
    map['per_page'] = perPage;
    map['to'] = to;
    return map;
  }

}

class Data {
  Data({
      this.id, 
      this.sportId, 
      this.slug, 
      this.name, 
      this.nameTranslations, 
      this.nameShort, 
      this.hasPhoto, 
      this.photo, 
      this.dateBirth, 
      this.nationalityCode, 
      this.performance, 
      this.preferredFormation,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    sportId = json['sport_id'];
    slug = json['slug'];
    name = json['name'];
    nameTranslations = json['name_translations'] != null ? NameTranslations.fromJson(json['name_translations']) : null;
    nameShort = json['name_short'];
    hasPhoto = json['has_photo'];
    photo = json['photo'];
    dateBirth = json['date_birth'];
    nationalityCode = json['nationality_code'];
    performance = json['performance'] != null ? Performance.fromJson(json['performance']) : null;
    preferredFormation = json['preferred_formation'];
  }
  int? id;
  int? sportId;
  String? slug;
  String? name;
  NameTranslations? nameTranslations;
  String? nameShort;
  bool? hasPhoto;
  String? photo;
  String? dateBirth;
  String? nationalityCode;
  Performance? performance;
  String? preferredFormation;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['sport_id'] = sportId;
    map['slug'] = slug;
    map['name'] = name;
    if (nameTranslations != null) {
      map['name_translations'] = nameTranslations?.toJson();
    }
    map['name_short'] = nameShort;
    map['has_photo'] = hasPhoto;
    map['photo'] = photo;
    map['date_birth'] = dateBirth;
    map['nationality_code'] = nationalityCode;
    if (performance != null) {
      map['performance'] = performance?.toJson();
    }
    map['preferred_formation'] = preferredFormation;
    return map;
  }

}

class Performance {
  Performance({
      this.total, 
      this.wins, 
      this.draws, 
      this.losses, 
      this.goalsScored, 
      this.goalsConceded, 
      this.totalPoints,});

  Performance.fromJson(dynamic json) {
    total = json['total'];
    wins = json['wins'];
    draws = json['draws'];
    losses = json['losses'];
    goalsScored = json['goals_scored'];
    goalsConceded = json['goals_conceded'];
    totalPoints = json['total_points'];
  }
  int? total;
  int? wins;
  int? draws;
  int? losses;
  int? goalsScored;
  int? goalsConceded;
  int? totalPoints;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total'] = total;
    map['wins'] = wins;
    map['draws'] = draws;
    map['losses'] = losses;
    map['goals_scored'] = goalsScored;
    map['goals_conceded'] = goalsConceded;
    map['total_points'] = totalPoints;
    return map;
  }

}

class NameTranslations {
  NameTranslations({
      this.en,});

  NameTranslations.fromJson(dynamic json) {
    en = json['en'];
  }
  String? en;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['en'] = en;
    return map;
  }

}