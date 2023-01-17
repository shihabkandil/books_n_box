import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app_project/utils/enums/bookarks_enum.dart';
import '../../../data/models/google_books/google_book.dart';
import '../../../data/repository/bookmarks_repository.dart';
part 'bookmarks_state.dart';

class BookmarksCubit extends Cubit<BookmarksState> {
  BookmarksCubit({BookmarksRepository? bookmarksRepository})
      : _bookmarksRepository = bookmarksRepository ?? BookmarksRepository(),
        super(BookmarksState(status: BookmarkStatus.notBookmarked));

  final BookmarksRepository _bookmarksRepository;
  Set<String> _bookmarkedBooksIds = {};

  void recordBookMark(GoogleBook? book) async {
    emit(BookmarksState(status: BookmarkStatus.notBookmarked));
    if (book == null) {
      emit(BookmarksState(status: BookmarkStatus.bookmarkFailed));
    } else {
      try {
        await _bookmarksRepository.recordMyBookMark(book);
        _bookmarkedBooksIds.add(book.id);
        emit(BookmarksState(status: BookmarkStatus.bookmarked));
      } on SocketException {
        emit(BookmarksState(status: BookmarkStatus.noInternetConnection));
      } catch (error) {
        emit(BookmarksState(status: BookmarkStatus.bookmarkFailed));
      }
    }
  }

  void deleteBookMark(String? bookID) async {
    if (bookID == null) {
      emit(BookmarksState(status: BookmarkStatus.bookmarkFailed));
    } else {
      try {
        await _bookmarksRepository.deleteMyBookMark(bookID);
        _bookmarkedBooksIds.remove(bookID);
        emit(BookmarksState(status: BookmarkStatus.notBookmarked));
      } on SocketException {
        emit(BookmarksState(status: BookmarkStatus.noInternetConnection));
      } catch (error) {
        emit(BookmarksState(status: BookmarkStatus.bookmarkFailed));
      }
    }
  }

  bool IsBookBookmarked(String? id) {
    if (id == null) return false;

    return _bookmarkedBooksIds.contains(id);
  }

  @override
  void onChange(Change<BookmarksState> change) {
    super.onChange(change);
    if (kDebugMode) {
      debugPrint(change.toString());
    }
  }
}