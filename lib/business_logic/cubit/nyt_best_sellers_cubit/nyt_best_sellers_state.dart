part of 'nyt_best_sellers_cubit.dart';

enum NytBestSellerBooksStatus {
  initialState,
}

class NytBestSellersState extends Equatable {
  const NytBestSellersState({required this.status, this.message});

  final NytBooksRepository status;
  final String? message;

  @override
  List<Object> get props => [status];
}
