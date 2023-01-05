import 'dart:convert';
import 'google_book.dart';

class GoogleResult {
  String? kind;
  int? totalItems;
  List<GoogleBook>? books;

  GoogleResult({this.kind, this.totalItems, this.books});

  GoogleResult.fromJson(Map<String, dynamic> json) {
    kind = json['kind'];
    totalItems = json['totalItems'];
    if (json['items'] != null) {
      books = [];
      json['items'].forEach((v) {
        books?.add(new GoogleBook.fromJson(v));
      });
    } else {
      books = [];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kind'] = this.kind;
    data['totalItems'] = this.totalItems;
    if (this.books != null) {
      data['items'] = this.books?.map((v) => v.toJson()).toList();
    }
    return data;
  }

}
  GoogleResult listOfBooksFromJson(String str) => GoogleResult.fromJson(json.decode(str));
