part of 'nyt_best_sellers_cubit.dart';

class NytBestSellersState extends Equatable {
  const NytBestSellersState({required this.status, this.message,this.books});

  final BooksDataStatus status;
  final String? message;
  final List<BestSellerBook>? books;

  @override
  List<Object> get props => [status];
}
