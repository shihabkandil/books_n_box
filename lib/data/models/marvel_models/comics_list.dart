// To parse this JSON data, do
//
//     final comicList = comicListFromJson(jsonString);

import 'dart:convert';
import 'data.dart';

ComicsList comicsListFromJson(String str) =>
    ComicsList.fromJson(json.decode(str));

String comicsListToJson(ComicsList data) => json.encode(data.toJson());

class ComicsList {
  ComicsList({
    this.code,
    this.status,
    this.copyright,
    this.attributionText,
    this.attributionHtml,
    this.data,
    this.etag,
  });

  String? code;
  String? status;
  String? copyright;
  String? attributionText;
  String? attributionHtml;
  Data? data;
  String? etag;

  factory ComicsList.fromJson(Map<String, dynamic> json) => ComicsList(
        code: json["code"],
        status: json["status"],
        copyright: json["copyright"],
        attributionText: json["attributionText"],
        attributionHtml: json["attributionHTML"],
        data: Data.fromJson(json["data"]),
        etag: json["etag"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "copyright": copyright,
        "attributionText": attributionText,
        "attributionHTML": attributionHtml,
        "data": (data == null ? null : data!.toJson()),
        "etag": etag,
      };
}

class Thumbnail {
  Thumbnail({
    this.path,
    this.extension,
  });

  String? path;
  String? extension;

  factory Thumbnail.fromJson(Map<String, dynamic> json) => Thumbnail(
        path: json["path"],
        extension: json["extension"],
      );

  Map<String, dynamic> toJson() => {
        "path": path,
        "extension": extension,
      };
}




// class Url {
//   Url({
//     this.type,
//     this.url,
//   });

//   String? type;
//   String? url;

//   factory Url.fromJson(Map<String, dynamic> json) => Url(
//         type: json["type"],
//         url: json["url"],
//       );

//   Map<String, dynamic> toJson() => {
//         "type": type,
//         "url": url,
//       };
// }
