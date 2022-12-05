import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repository/nyt_books_repository.dart';

part 'nyt_best_sellers_state.dart';

class NytBestSellers extends Cubit<NytBestSellersState> {
  NytBestSellers(super.initialState);
}
