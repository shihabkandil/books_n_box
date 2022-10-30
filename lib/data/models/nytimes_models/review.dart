// To parse this JSON data, do
//
//     final review = reviewFromJson(jsonString);

import 'dart:convert';

Review reviewFromJson(String str) => Review.fromJson(json.decode(str));

String reviewToJson(Review data) => json.encode(data.toJson());

class Review {
  Review({
    this.status,
    this.copyright,
    this.numResults,
    this.results,
  });

  String? status;
  String? copyright;
  int? numResults;
  List<Result>? results;

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        status: json["status"],
        copyright: json["copyright"],
        numResults: json["num_results"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "copyright": copyright,
        "num_results": numResults,
        "results": (results == null
            ? null
            : List<dynamic>.from(results!.map((x) => x.toJson()))),
      };
}

class Result {
  Result({
    this.url,
    this.publicationDt,
    this.byline,
    this.bookTitle,
    this.bookAuthor,
    this.summary,
    this.isbn13,
  });

  String? url;
  DateTime? publicationDt;
  String? byline;
  String? bookTitle;
  String? bookAuthor;
  String? summary;
  List<String>? isbn13;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        url: json["url"],
        publicationDt: DateTime.parse(json["publication_dt"]),
        byline: json["byline"],
        bookTitle: json["book_title"],
        bookAuthor: json["book_author"],
        summary: json["summary"],
        isbn13: List<String>.from(json["isbn13"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "publication_dt": (publicationDt == null
            ? ""
            : "${publicationDt!.year.toString().padLeft(4, '0')}-${publicationDt!.month.toString().padLeft(2, '0')}-${publicationDt!.day.toString().padLeft(2, '0')}"),
        "byline": byline,
        "book_title": bookTitle,
        "book_author": bookAuthor,
        "summary": summary,
        "isbn13":
            (isbn13 == null ? null : List<dynamic>.from(isbn13!.map((x) => x))),
      };
}
