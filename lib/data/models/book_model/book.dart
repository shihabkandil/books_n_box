// To parse this JSON data, do
//
//     final book = bookFromJson(jsonString);

import 'dart:convert';
import '../../models/book_model/volume_info.dart';

Book bookFromJson(String str) => Book.fromJson(json.decode(str));

String bookToJson(Book data) => json.encode(data.toJson());

class Book {
  Book({required this.id,
      this.selfLink,
      this.volumeInfo,
      this.isBookmarked = false,
      this.status = 0});

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
        "volumeInfo": (volumeInfo == null ? null : volumeInfo!.toJson()),
      };
}
