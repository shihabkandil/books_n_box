import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/nytimes_models/nytimes_best_sellers_models/nyt_best_sellers.dart';
import '../../../data/repository/nyt_books_repository.dart';
import '../../../utils/enums/books_data_status_enum.dart';

part 'nyt_best_sellers_state.dart';

class NytBestSellersCubit extends Cubit<NytBestSellersState> {
  NytBestSellersCubit({NytBooksRepository? nytBooksRepository})
      : _nytBooksRepository = nytBooksRepository ?? NytBooksRepository(),
        super(NytBestSellersState(status: BooksDataStatus.loadingState));

  final NytBooksRepository _nytBooksRepository;

  void getNytBestSellerBooks() async {
    try {
      NytBestSellers booksResult = await _nytBooksRepository.getBestSellersBooks();
      List<BooksList>? booksLists = booksResult.results?.lists;
      if (booksLists != null && booksLists.length >= 1) {
        List<BestSellerBook> bestSellerBooks = booksLists.first.books ?? [];
        if (bestSellerBooks.isEmpty) {
          emit(NytBestSellersState(status: BooksDataStatus.noDataReceived));
        } else {
          bestSellerBooks.removeWhere((element) => element.bookImage == null);
          emit(NytBestSellersState(status: BooksDataStatus.booksLoaded, books: bestSellerBooks),
          );
        }
      }
    } on SocketException {
      emit(NytBestSellersState(status: BooksDataStatus.noInternetConnection));
    } catch (error) {
      emit(NytBestSellersState(status: BooksDataStatus.booksRetrievalFailed));
    }
  }

  @override
  void onChange(Change<NytBestSellersState> change) {
    super.onChange(change);
    if(kDebugMode){
      debugPrint(change.toString());
    }
  }
}
