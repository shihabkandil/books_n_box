import 'models/book_model/book.dart';
import 'models/book_model/image_links.dart';
import 'models/book_model/volume_info.dart';

class BookData {
  ImageLinks _images = ImageLinks(
      smallThumbnail:
          "https://books.google.com/books?id=zyTCAlFPjgYC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api",
      small:
          "https://books.google.com/books?id=zyTCAlFPjgYC&printsec=frontcover&img=1&zoom=2&edge=curl&source=gbs_api",
      large:
          "https://books.google.com/books?id=zyTCAlFPjgYC&printsec=frontcover&img=1&zoom=4&edge=curl&source=gbs_api");

  VolumeInfo _volume = VolumeInfo(
      title: 'The Google story',
      authors: ["David A. Vise", "Mark Malseed"],
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      pageCount: 207,
      mainCategory: 'Business & Economics / Entrepreneurship',
      averageRating: 5,
      ratingsCount: 15);

  Book _book = Book(
    id: 'zyTCAlFPjgYC',
    selfLink: 'https://www.googleapis.com/books/v1/volumes/zyTCAlFPjgYC',
  );

  Book getBook() {
    _book.volumeInfo = _volume;
    _book.volumeInfo!.imageLinks = _images;
    return _book;
  }

  String getAuthors() {
    String auth = _volume.authors.toString();
    auth = auth.substring(1, auth.length - 1);
    return auth;
  }

  void setBookmark(bool bookmark, int? status) {
    //if bookmarked removes it, if not bookmarked adds it
    _book.isBookmarked = bookmark;
    if (status == null) {
      _book.status = 0;
    } else {
      _book.status = status;
    }
  }
}
