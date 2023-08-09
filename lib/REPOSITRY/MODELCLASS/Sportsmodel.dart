class Sportsmodel {
  Sportsmodel({
      this.data, 
      this.meta,});

  Sportsmodel.fromJson(dynamic json) {
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
      this.categoryId, 
      this.venueId, 
      this.managerId, 
      this.slug, 
      this.name, 
      this.hasLogo, 
      this.logo, 
      this.nameTranslations, 
      this.nameShort, 
      this.nameFull, 
      this.nameCode, 
      this.hasSub, 
      this.gender, 
      this.isNationality, 
      this.countryCode, 
      this.country, 
      this.flag, 
      this.foundation, 
      this.details,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    sportId = json['sport_id'];
    categoryId = json['category_id'];
    venueId = json['venue_id'];
    managerId = json['manager_id'];
    slug = json['slug'];
    name = json['name'];
    hasLogo = json['has_logo'];
    logo = json['logo'];
    nameTranslations = json['name_translations'] != null ? NameTranslations.fromJson(json['name_translations']) : null;
    nameShort = json['name_short'];
    nameFull = json['name_full'];
    nameCode = json['name_code'];
    hasSub = json['has_sub'];
    gender = json['gender'];
    isNationality = json['is_nationality'];
    countryCode = json['country_code'];
    country = json['country'];
    flag = json['flag'];
    foundation = json['foundation'];
    details = json['details'];
  }
  int? id;
  int? sportId;
  int? categoryId;
  int? venueId;
  int? managerId;
  String? slug;
  String? name;
  bool? hasLogo;
  String? logo;
  NameTranslations? nameTranslations;
  String? nameShort;
  String? nameFull;
  String? nameCode;
  bool? hasSub;
  String? gender;
  bool? isNationality;
  String? countryCode;
  String? country;
  String? flag;
  dynamic foundation;
  dynamic details;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['sport_id'] = sportId;
    map['category_id'] = categoryId;
    map['venue_id'] = venueId;
    map['manager_id'] = managerId;
    map['slug'] = slug;
    map['name'] = name;
    map['has_logo'] = hasLogo;
    map['logo'] = logo;
    if (nameTranslations != null) {
      map['name_translations'] = nameTranslations?.toJson();
    }
    map['name_short'] = nameShort;
    map['name_full'] = nameFull;
    map['name_code'] = nameCode;
    map['has_sub'] = hasSub;
    map['gender'] = gender;
    map['is_nationality'] = isNationality;
    map['country_code'] = countryCode;
    map['country'] = country;
    map['flag'] = flag;
    map['foundation'] = foundation;
    map['details'] = details;
    return map;
  }

}

class NameTranslations {
  NameTranslations({
      this.en, 
      this.ru, 
      this.de, 
      this.es, 
      this.fr, 
      this.zh, 
      this.tr, 
      this.el, 
      this.it, 
      this.nl, 
      this.pt,});

  NameTranslations.fromJson(dynamic json) {
    en = json['en'];
    ru = json['ru'];
    de = json['de'];
    es = json['es'];
    fr = json['fr'];
    zh = json['zh'];
    tr = json['tr'];
    el = json['el'];
    it = json['it'];
    nl = json['nl'];
    pt = json['pt'];
  }
  String? en;
  String? ru;
  String? de;
  String? es;
  String? fr;
  String? zh;
  String? tr;
  String? el;
  String? it;
  String? nl;
  String? pt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['en'] = en;
    map['ru'] = ru;
    map['de'] = de;
    map['es'] = es;
    map['fr'] = fr;
    map['zh'] = zh;
    map['tr'] = tr;
    map['el'] = el;
    map['it'] = it;
    map['nl'] = nl;
    map['pt'] = pt;
    return map;
  }

}