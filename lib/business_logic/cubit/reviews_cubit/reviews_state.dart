part of 'reviews_cubit.dart';

enum ReviewsStatus {
  initialState,
  reviewSaved,
  submittedReviewCantBeEmpty,
  savingReviewFailed,
  failedToGetBookDataForReview,
  submittingReview,
  latestReviewsLoaded,
  loadingLatestReviews,
  latestReviewsLoadFailure,
  noLatestReviewsFound,
  booksReviewsLoadedSuccessfully,
  booksReviewsLoadingFailure,
  booksReviewsLoading
}

class ReviewsState extends Equatable {
  final ReviewsStatus status;

  final List<UserReview>? reviews;
  final List<GoogleBook>? googleBooks;

  ReviewsState({this.reviews, this.googleBooks, required this.status});

  @override
  List<Object?> get props => [status];
}
