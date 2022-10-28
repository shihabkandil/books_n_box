// To parse this JSON data, do
//
//     final book = bookFromJson(jsonString);

import 'dart:convert';

Book bookFromJson(String str) => Book.fromJson(json.decode(str));

String bookToJson(Book data) => json.encode(data.toJson());

class Book {
  Book(
      {required this.id,
      this.selfLink,
      this.volumeInfo,
      this.isBookmarked = false,this.status=0});

  String id;
  String? selfLink;
  VolumeInfo? volumeInfo;
  bool isBookmarked;
  int status;

  factory Book.fromJson(Map<String, dynamic> json) => Book(
        id: json["id"],
        selfLink: json["selfLink"],
        volumeInfo: VolumeInfo.fromJson(json["volumeInfo"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "selfLink": selfLink,
        "volumeInfo": volumeInfo!.toJson(),
      };
}

class VolumeInfo {
  VolumeInfo({
    this.title,
    this.authors,
    this.description,
    this.pageCount,
    this.mainCategory,
    this.averageRating,
    this.ratingsCount,
    this.imageLinks,
  });

  String? title;
  List<String>? authors;
  String? description;
  int? pageCount;
  String? mainCategory;
  double? averageRating;
  int? ratingsCount;
  ImageLinks? imageLinks;

  factory VolumeInfo.fromJson(Map<String, dynamic> json) => VolumeInfo(
        title: json["title"],
        authors: List<String>.from(json["authors"].map((x) => x)),
        description: json["description"],
        pageCount: json["pageCount"],
        mainCategory: json["mainCategory"],
        averageRating: json["averageRating"].toDouble(),
        ratingsCount: json["ratingsCount"],
        imageLinks: ImageLinks.fromJson(json["imageLinks"]),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "authors": List<dynamic>.from(authors!.map((x) => x)),
        "description": description,
        "pageCount": pageCount,
        "mainCategory": mainCategory,
        "averageRating": averageRating,
        "ratingsCount": ratingsCount,
        "imageLinks": imageLinks!.toJson(),
      };
}

class ImageLinks {
  ImageLinks({
    this.smallThumbnail,
    this.small,
    this.large,
  });

  String? smallThumbnail;
  String? small;
  String? large;

  factory ImageLinks.fromJson(Map<String, dynamic> json) => ImageLinks(
        smallThumbnail: json["smallThumbnail"],
        small: json["small"],
        large: json["large"],
      );

  Map<String, dynamic> toJson() => {
        "smallThumbnail": smallThumbnail,
        "small": small,
        "large": large,
      };
}
