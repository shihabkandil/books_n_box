// To parse this JSON data, do
//
//     final book = bookFromJson(jsonString);

import 'dart:convert';

import 'package:mobile_app_project/data/models/google_books/volume_info.dart';


GoogleBook bookFromJson(String str) => GoogleBook.fromJson(json.decode(str));

String bookToJson(GoogleBook data) => json.encode(data.toJson());

class GoogleBook {
  GoogleBook({required this.id,
      this.selfLink,
      this.volumeInfo,
      this.isBookmarked = false,
      this.status = 0});

  String id;
  String? selfLink;
  VolumeInfo? volumeInfo;
  bool isBookmarked;
  int status;

  factory GoogleBook.fromJson(Map<String, dynamic> json) => GoogleBook(
        id: json["id"],
        selfLink: json["selfLink"],
        volumeInfo: VolumeInfo.fromJson(json["volumeInfo"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "selfLink": selfLink,
        "volumeInfo": (volumeInfo == null ? null : volumeInfo!.toJson()),
      };
}
