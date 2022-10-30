import 'book_detail.dart';
import 'review_link.dart';

class Result {
  Result({
    this.listName,
    this.displayName,
    this.bestsellersDate,
    this.publishedDate,
    this.rank,
    this.rankLastWeek,
    this.weeksOnList,
    this.isbns,
    this.bookDetails,
    this.reviews,
  });

  String? listName;
  String? displayName;
  DateTime? bestsellersDate;
  DateTime? publishedDate;
  int? rank;
  int? rankLastWeek;
  int? weeksOnList;
  List<Isbn>? isbns;
  List<BookDetail>? bookDetails;
  List<ReviewLink>? reviews;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        listName: json["list_name"],
        displayName: json["display_name"],
        bestsellersDate: DateTime.parse(json["bestsellers_date"]),
        publishedDate: DateTime.parse(json["published_date"]),
        rank: json["rank"],
        rankLastWeek: json["rank_last_week"],
        weeksOnList: json["weeks_on_list"],
        isbns: List<Isbn>.from(json["isbns"].map((x) => Isbn.fromJson(x))),
        bookDetails: List<BookDetail>.from(
            json["book_details"].map((x) => BookDetail.fromJson(x))),
        reviews: List<ReviewLink>.from(
            json["reviews"].map((x) => ReviewLink.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "list_name": listName,
        "display_name": displayName,
        "bestsellers_date":
            "${bestsellersDate!.year.toString().padLeft(4, '0')}-${bestsellersDate!.month.toString().padLeft(2, '0')}-${bestsellersDate!.day.toString().padLeft(2, '0')}",
        "published_date":
            "${publishedDate!.year.toString().padLeft(4, '0')}-${publishedDate!.month.toString().padLeft(2, '0')}-${publishedDate!.day.toString().padLeft(2, '0')}",
        "rank": rank,
        "rank_last_week": rankLastWeek,
        "weeks_on_list": weeksOnList,
        "isbns": List<dynamic>.from(isbns!.map((x) => x.toJson())),
        "book_details": List<dynamic>.from(bookDetails!.map((x) => x.toJson())),
        "reviews": List<dynamic>.from(reviews!.map((x) => x.toJson())),
      };
}

//-------------------------------

class Isbn {
  Isbn({
    this.isbn10,
    this.isbn13,
  });

  int? isbn10;
  String? isbn13;

  factory Isbn.fromJson(Map<String, dynamic> json) => Isbn(
        isbn10: json["isbn10"],
        isbn13: json["isbn13"],
      );

  Map<String, dynamic> toJson() => {
        "isbn10": isbn10,
        "isbn13": isbn13,
      };
}
