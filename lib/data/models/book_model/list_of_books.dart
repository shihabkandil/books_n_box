import 'dart:convert';
import 'book.dart';

class ListOfBooks {
  String? kind;
  int? totalItems;
  List<Book>? Books;

  ListOfBooks({this.kind, this.totalItems, this.Books});

  ListOfBooks.fromJson(Map<String, dynamic> json) {
    kind = json['kind'];
    totalItems = json['totalItems'];
    if (json['items'] != null) {
      Books = [];
      json['items'].forEach((v) {
        Books?.add(new Book.fromJson(v));
      });
    } else {
      Books = [];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kind'] = this.kind;
    data['totalItems'] = this.totalItems;
    if (this.Books != null) {
      data['items'] = this.Books?.map((v) => v.toJson()).toList();
    }
    return data;
  }

}
  ListOfBooks listOfBooksFromJson(String str) => ListOfBooks.fromJson(json.decode(str));
