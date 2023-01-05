import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app_project/data/models/google_books/google_book.dart';
import 'package:mobile_app_project/data/models/google_books/google_result.dart';
import 'package:mobile_app_project/data/repository/google_books_repository.dart';
import '../../../utils/enums/books_data_status_enum.dart';

part 'google_books_state.dart';

class GoogleBooksCubit extends Cubit<GoogleBooksState> {

  GoogleBooksCubit({GoogleBooksRepository? googleBooksRepository}) : _googleBooksRepository = googleBooksRepository ?? GoogleBooksRepository(),
  super(GoogleBooksState(status: BooksDataStatus.initialState));

  final GoogleBooksRepository _googleBooksRepository;

  void searchGoogleBooks(String query) async {

    if(query.isEmpty){
      emit(GoogleBooksState(status: BooksDataStatus.emptyQuery));
    }else{

    try {
      GoogleResult googleResult = await _googleBooksRepository.getGoogleBooks(query);
      List<GoogleBook>? googleBooksList = googleResult.books;
      if (googleBooksList != null && googleBooksList.length >= 1) {
          emit(GoogleBooksState(status: BooksDataStatus.booksLoaded,books: googleBooksList));
        }else{
          emit(GoogleBooksState(status: BooksDataStatus.noDataReceived));
        }
    } on SocketException {
      emit(GoogleBooksState(status: BooksDataStatus.noInternetConnection));
    } catch (error) {
      emit(GoogleBooksState(status: BooksDataStatus.booksRetrievalFailed));
    }
    
    }

  }

  @override
  void onChange(Change<GoogleBooksState> change) {
    super.onChange(change);
    if(kDebugMode){
      debugPrint(change.toString());
    }
  }
}
