part of'reviews_cubit.dart';

enum ReviewsStatus {
  initialState,
  reviewSaved,
  submittedReviewCantBeEmpty,
  savingReviewFailed,
  failedToGetBookDataForReview,
  submittingReview
}

class ReviewsState extends Equatable {
  final ReviewsStatus status;

  //final List<Reviews>? reviews;
  ReviewsState({required this.status});

  @override
  List<Object?> get props => [status];
}
