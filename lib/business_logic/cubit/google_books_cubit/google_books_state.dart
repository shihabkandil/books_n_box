part of 'google_books_cubit.dart';

class GoogleBooksState extends Equatable {
  const GoogleBooksState({required this.status, this.message, this.books, this.genreStatusList,this.genreBooks});

  final BooksDataStatus status;
  final List<BooksDataStatus>? genreStatusList;
  final String? message;
  final List<GoogleBook>? books;
  final Map<String, List>? genreBooks;
  @override
  List<Object> get props => [status];
}
