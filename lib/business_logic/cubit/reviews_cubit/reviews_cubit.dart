import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/google_books/google_book.dart';
import '../../../data/models/user_review.dart';
import '../../../data/repository/reviews_repository.dart';

part 'reviews_state.dart';

class ReviewsCubit extends Cubit<ReviewsState> {
  ReviewsCubit({ReviewRepository? reviewsRepository, GoogleBook? googleBook})
      : _reviewsRepository = reviewsRepository ?? ReviewRepository(),
        _googleBook = googleBook,
        super(ReviewsState(status: ReviewsStatus.initialState));
  final ReviewRepository _reviewsRepository;
  final GoogleBook? _googleBook;

  void resetValidatorState() {
    emit(ReviewsState(status: ReviewsStatus.initialState));
  }

  Future<void> submitReview({required String review}) async {
    if (review.isEmpty) {
      emit(ReviewsState(status: ReviewsStatus.submittedReviewCantBeEmpty));
    } else if (_googleBook == null) {
      emit(ReviewsState(status: ReviewsStatus.failedToGetBookDataForReview));
    } else {
      try {
        emit(ReviewsState(status: ReviewsStatus.submittingReview));
        await _reviewsRepository.submitUserReview(
            review: review, googleBook: _googleBook!);
        emit(ReviewsState(status: ReviewsStatus.reviewSaved));
      } catch (_) {
        emit(ReviewsState(status: ReviewsStatus.savingReviewFailed));
      }
    }
  }

  Future<void> getUserReviewAboutBook({required String bookId}) async {
    try {
      await _reviewsRepository.getCurrentUserBookReview(bookId: bookId);
      emit(ReviewsState(status: ReviewsStatus.reviewSaved));
    } catch (_) {
      emit(ReviewsState(status: ReviewsStatus.savingReviewFailed));
    }
  }

  Future<void> getReviewedBookReviews({required String bookId}) async {
    emit(ReviewsState(status: ReviewsStatus.booksReviewsLoading));
    try {
      final bookReviews =
          await _reviewsRepository.getBookReviews(bookId: bookId);
      if (bookReviews.isNotEmpty) {
        emit(ReviewsState(
            status: ReviewsStatus.booksReviewsLoadedSuccessfully,
            reviews: bookReviews));
      } else {
        emit(ReviewsState(status: ReviewsStatus.noLatestReviewsFound));
      }
    } catch (_) {
      emit(ReviewsState(status: ReviewsStatus.booksReviewsLoadingFailure));
    }
  }

  Future<void> getLatestReviewedBooks() async {
    emit(ReviewsState(status: ReviewsStatus.loadingLatestReviews));
    try {
      final reviewedBooks = await _reviewsRepository.getLatestReviewedBooks();
      if (reviewedBooks.isNotEmpty) {
        emit(ReviewsState(
            status: ReviewsStatus.latestReviewsLoaded,
            googleBooks: reviewedBooks));
      } else {
        emit(ReviewsState(
            status: ReviewsStatus.noLatestReviewsFound,
            googleBooks: reviewedBooks));
      }
    } catch (_) {
      emit(ReviewsState(status: ReviewsStatus.latestReviewsLoadFailure));
    }
  }

  @override
  void onChange(Change<ReviewsState> change) {
    super.onChange(change);
    print(change);
  }
}
