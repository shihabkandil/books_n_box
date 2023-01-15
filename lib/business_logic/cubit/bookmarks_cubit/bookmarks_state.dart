part of 'bookmarks_cubit.dart';


class BookmarksState extends Equatable {
  
  const BookmarksState({required this.status, this.message, this.books,this.genreBooks});

  final BookmarkStatus status;
  final String? message;
  final List<GoogleBook>? books;
  final Map<String, List>? genreBooks;
  @override
  List<Object> get props => [status];
}
