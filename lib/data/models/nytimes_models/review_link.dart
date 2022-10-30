class ReviewLink {
  ReviewLink({
    this.bookReviewLink,
    this.sundayReviewLink,
  });

  String? bookReviewLink;
  String? sundayReviewLink;

  factory ReviewLink.fromJson(Map<String, dynamic> json) => ReviewLink(
        bookReviewLink: json["book_review_link"],
        sundayReviewLink: json["sunday_review_link"],
      );

  Map<String, dynamic> toJson() => {
        "book_review_link": bookReviewLink,
        "sunday_review_link": sundayReviewLink,
      };
}
