import 'dart:convert';

TopNewsApiModel topNewsApiModelFromJson(String str) =>
    TopNewsApiModel.fromJson(json.decode(str));

String topNewsApiModelToJson(TopNewsApiModel data) =>
    json.encode(data.toJson());

class TopNewsApiModel {
  final Meta? meta;
  final List<Datum>? data;

  TopNewsApiModel({this.meta, this.data});

  factory TopNewsApiModel.fromJson(Map<String, dynamic> json) =>
      TopNewsApiModel(
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
    "meta": meta?.toJson(),
    "data": data == null
        ? []
        : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  final String? uuid;
  final String? title;
  final String? description;
  final Keywords? keywords;
  final String? snippet;
  final String? url;
  final String? imageUrl;
  final Language? language;
  final DateTime? publishedAt;
  final String? source;
  final List<Category>? categories;
  final dynamic relevanceScore;
  final Locale? locale;

  Datum({
    this.uuid,
    this.title,
    this.description,
    this.keywords,
    this.snippet,
    this.url,
    this.imageUrl,
    this.language,
    this.publishedAt,
    this.source,
    this.categories,
    this.relevanceScore,
    this.locale,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    uuid: json["uuid"],
    title: json["title"],
    description: json["description"],
    keywords: json["keywords"] != null
        ? keywordsValues.map[json["keywords"]]
        : null,
    snippet: json["snippet"],
    url: json["url"],
    imageUrl: json["image_url"],
    language: json["language"] != null
        ? languageValues.map[json["language"]]
        : null,
    publishedAt: json["published_at"] == null
        ? null
        : DateTime.tryParse(json["published_at"]),
    source: json["source"],
    categories: json["categories"] == null
        ? []
        : List<Category>.from(
            json["categories"]
                .map((x) => categoryValues.map[x])
                .whereType<Category>(),
          ),
    relevanceScore: json["relevance_score"],
    locale: json["locale"] != null ? localeValues.map[json["locale"]] : null,
  );

  Map<String, dynamic> toJson() => {
    "uuid": uuid,
    "title": title,
    "description": description,
    "keywords": keywordsValues.reverse[keywords],
    "snippet": snippet,
    "url": url,
    "image_url": imageUrl,
    "language": languageValues.reverse[language],
    "published_at": publishedAt?.toIso8601String(),
    "source": source,
    "categories": categories == null
        ? []
        : List<dynamic>.from(categories!.map((x) => categoryValues.reverse[x])),
    "relevance_score": relevanceScore,
    "locale": localeValues.reverse[locale],
  };
}

enum Category { Business, Entertainment, General, Politics }

final categoryValues = EnumValues({
  "Business": Category.Business,
  "Entertainment": Category.Entertainment,
  "General": Category.General,
  "Politics": Category.Politics,
});

enum Keywords { EMPTY, METRO_US_NEWS_CRIME_MURDERS_THE_BRONX_TORTURE }

final keywordsValues = EnumValues({
  "": Keywords.EMPTY,
  "Metro, US News, crime, murders, the bronx, torture":
      Keywords.METRO_US_NEWS_CRIME_MURDERS_THE_BRONX_TORTURE,
});

enum Language { EN }

final languageValues = EnumValues({"en": Language.EN});

enum Locale { US }

final localeValues = EnumValues({"us": Locale.US});

class Meta {
  final int? found;
  final int? returned;
  final int? limit;
  final int? page;

  Meta({this.found, this.returned, this.limit, this.page});

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    found: json["found"],
    returned: json["returned"],
    limit: json["limit"],
    page: json["page"],
  );

  Map<String, dynamic> toJson() => {
    "found": found,
    "returned": returned,
    "limit": limit,
    "page": page,
  };
}

class EnumValues<T> {
  final Map<String, T> map;
  late final Map<T, String> reverseMap;

  EnumValues(this.map) {
    reverseMap = map.map((k, v) => MapEntry(v, k));
  }

  Map<T, String> get reverse => reverseMap;
}
