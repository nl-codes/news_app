import 'dart:convert';

SingleNewsApiModel singleNewsApiModelFromJson(String str) =>
    SingleNewsApiModel.fromJson(json.decode(str));

String singleNewsApiModelToJson(SingleNewsApiModel data) =>
    json.encode(data.toJson());

class SingleNewsApiModel {
  final String? uuid;
  final String? title;
  final String? description;
  final String? keywords;
  final String? snippet;
  final String? url;
  final String? imageUrl;
  final String? language;
  final DateTime? publishedAt;
  final String? source;
  final List<String>? categories;

  SingleNewsApiModel({
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
  });

  factory SingleNewsApiModel.fromJson(Map<String, dynamic> json) =>
      SingleNewsApiModel(
        uuid: json["uuid"],
        title: json["title"],
        description: json["description"],
        keywords: json["keywords"],
        snippet: json["snippet"],
        url: json["url"],
        imageUrl: json["image_url"],
        language: json["language"],
        publishedAt: json["published_at"] == null
            ? null
            : DateTime.parse(json["published_at"]),
        source: json["source"],
        categories: json["categories"] == null
            ? []
            : List<String>.from(json["categories"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
    "uuid": uuid,
    "title": title,
    "description": description,
    "keywords": keywords,
    "snippet": snippet,
    "url": url,
    "image_url": imageUrl,
    "language": language,
    "published_at": publishedAt?.toIso8601String(),
    "source": source,
    "categories": categories == null
        ? []
        : List<dynamic>.from(categories!.map((x) => x)),
  };
}
