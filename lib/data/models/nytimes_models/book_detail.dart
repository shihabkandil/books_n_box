class BookDetail {
  BookDetail({
    this.title,
    // this.description,
    this.author,
    this.primaryIsbn13,
    this.primaryIsbn10,
  });

  String? title;
  //String? description;
  String? author;
  String? primaryIsbn13;
  int? primaryIsbn10;

  factory BookDetail.fromJson(Map<String, dynamic> json) => BookDetail(
        title: json["title"],
        //description: json["description"],
        author: json["author"],
        primaryIsbn13: json["primary_isbn13"],
        primaryIsbn10: json["primary_isbn10"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        //"description": description,
        "author": author,
        "primary_isbn13": primaryIsbn13,
        "primary_isbn10": primaryIsbn10,
      };
}


