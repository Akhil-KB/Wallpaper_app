// To parse this JSON data, do
//
//     final search = searchFromJson(jsonString);

import 'dart:convert';

import 'package:walpaper/Model/latestModel.dart';

Search searchFromJson(String str) => Search.fromJson(json.decode(str));

String searchToJson(Search data) => json.encode(data.toJson());

class Search {
  int totalResults;
  int page;
  int perPage;
  List<Photo> photos;
  String nextPage;

  Search({
    required this.totalResults,
    required this.page,
    required this.perPage,
    required this.photos,
    required this.nextPage,
  });

  factory Search.fromJson(Map<String, dynamic> json) => Search(
    totalResults: json["total_results"],
    page: json["page"],
    perPage: json["per_page"],
    photos: List<Photo>.from(json["photos"].map((x) => Photo.fromJson(x))),
    nextPage: json["next_page"],
  );

  Map<String, dynamic> toJson() => {
    "total_results": totalResults,
    "page": page,
    "per_page": perPage,
    "photos": List<dynamic>.from(photos.map((x) => x.toJson())),
    "next_page": nextPage,
  };
}


class Src {
  String original;
  String large2X;
  String large;
  String medium;
  String small;
  String portrait;
  String landscape;
  String tiny;

  Src({
    required this.original,
    required this.large2X,
    required this.large,
    required this.medium,
    required this.small,
    required this.portrait,
    required this.landscape,
    required this.tiny,
  });

  factory Src.fromJson(Map<String, dynamic> json) => Src(
    original: json["original"],
    large2X: json["large2x"],
    large: json["large"],
    medium: json["medium"],
    small: json["small"],
    portrait: json["portrait"],
    landscape: json["landscape"],
    tiny: json["tiny"],
  );

  Map<String, dynamic> toJson() => {
    "original": original,
    "large2x": large2X,
    "large": large,
    "medium": medium,
    "small": small,
    "portrait": portrait,
    "landscape": landscape,
    "tiny": tiny,
  };
}
