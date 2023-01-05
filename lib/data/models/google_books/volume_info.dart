import 'image_links.dart';

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
  num? averageRating;
  int? ratingsCount;
  ImageLinks? imageLinks;

  factory VolumeInfo.fromJson(Map<String, dynamic> json) => VolumeInfo(
        title: json["title"],
        authors: List<String>.from(json["authors"].map((x) => x)),
        description: json["description"],
        pageCount: json["pageCount"],
        mainCategory: json["mainCategory"],
        averageRating: json["averageRating"],
        ratingsCount: json["ratingsCount"],
        imageLinks: (json["imageLinks"] == null ? null : ImageLinks.fromJson(json["imageLinks"])),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "authors": (authors == null ? null : List<dynamic>.from(authors!.map((x) => x))),
        "description": description,
        "pageCount": pageCount,
        "mainCategory": mainCategory,
        "averageRating": averageRating,
        "ratingsCount": ratingsCount,
        "imageLinks": (imageLinks == null ? null : imageLinks!.toJson()),
      };
}
