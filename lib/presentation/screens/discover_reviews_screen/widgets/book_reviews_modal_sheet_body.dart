import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app_project/business_logic/cubit/reviews_cubit/reviews_cubit.dart';
import 'package:mobile_app_project/presentation/screens/discover_reviews_screen/widgets/review_card.dart';
import 'package:mobile_app_project/presentation/shared_widgets/header_text.dart';

class BookReviewsModalSheetBody extends StatelessWidget {
  const BookReviewsModalSheetBody({Key? key, required this.bookId})
      : super(key: key);
  final String bookId;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(30),
      child: BlocProvider(
        create: (context) =>
            ReviewsCubit()..getReviewedBookReviews(bookId: bookId),
        child: Builder(
          builder: (context) => BlocBuilder<ReviewsCubit, ReviewsState>(
            builder: (context, state) {
              if (state.status == ReviewsStatus.booksReviewsLoadedSuccessfully &&
                  state.reviews != null) {
                return ListView.separated(
                    itemBuilder: (context, index) => ReviewCard(
                          userImageUrl: state.reviews![index].userImageUrl,
                          review: state.reviews![index].review,
                          userName: state.reviews![index].userName,
                        ),
                    separatorBuilder: (context, index) => SizedBox(height: 10),
                    itemCount: state.reviews!.length);
              } else if (state.status == ReviewsStatus.noLatestReviewsFound) {
                return HeaderText(text: 'No reviewed books found');
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
