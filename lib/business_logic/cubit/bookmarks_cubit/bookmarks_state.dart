part of 'bookmarks_cubit.dart';

class BookmarksState extends Equatable {
  const BookmarksState(
      {required this.status, this.message, this.bookmarkedBooks});
  final List<GoogleBook>? bookmarkedBooks;
  final BookmarkStatus status;
  final String? message;

  @override
  List<Object> get props => [status];
}