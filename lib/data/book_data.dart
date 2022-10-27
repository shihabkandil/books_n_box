import 'models/book.dart';

class BookData {
  Book book = Book(
    id: 'zyTCAlFPjgYC',
    title: 'The Google story',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    selfLink: 'https://www.googleapis.com/books/v1/volumes/zyTCAlFPjgYC',
    ratingsCount: 15,
    avgRating: 5,
    category: 'Business & Economics / Entrepreneurship',
    imageLinks: {
      "smallThumbnail":
          "https://books.google.com/books?id=zyTCAlFPjgYC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api",
      "small":
          "https://books.google.com/books?id=zyTCAlFPjgYC&printsec=frontcover&img=1&zoom=2&edge=curl&source=gbs_api",
      "large":
          "https://books.google.com/books?id=zyTCAlFPjgYC&printsec=frontcover&img=1&zoom=4&edge=curl&source=gbs_api"
    },
    authors: ["David A. Vise", "Mark Malseed"],
  );

  Book getBook() {
    return book;
  }

  String getAuthors() {
    String auth = book.authors.toString();
    auth = auth.substring(1, auth.length - 1);
    return auth;
  }

  void setBookmark(int? status) {
    //if bookmarked removes it, if not bookmarked adds it
    book.isBookmarked = !book.isBookmarked;
    if (status == null) {
      book.status = 0;
    } else {
      book.status = status;
    }
  }
}
