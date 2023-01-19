import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobile_app_project/business_logic/cubit/reviews_cubit/reviews_cubit.dart';
import 'package:mobile_app_project/presentation/screens/discover_reviews_screen/widgets/book_reviews_modal_sheet_body.dart';
import 'package:mobile_app_project/presentation/shared_widgets/header_text.dart';
import 'widgets/reviewed_book_card.dart';

class DiscoverReviewsScreen extends StatelessWidget {
  const DiscoverReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context);
    return BlocProvider<ReviewsCubit>(
      create: (context) => ReviewsCubit()..getLatestReviewedBooks(),
      child: Builder(builder: (context) {
        return Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(top: 45, left: 20, bottom: 20, right: 10),
              alignment: localization!.localeName == 'ar'
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: RefreshIndicator(
                onRefresh: () => BlocProvider.of<ReviewsCubit>(context)
                    .getLatestReviewedBooks(),
                child: BlocBuilder<ReviewsCubit, ReviewsState>(
                  builder: (context, state) {
                    if (state.status == ReviewsStatus.latestReviewsLoaded &&
                        state.googleBooks != null) {
                      return ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, index) => InkWell(
                                onTap: () => showModalBottomSheet(
                                  context: context,
                                  builder: (context) =>
                                      BookReviewsModalSheetBody(
                                          bookId: state.googleBooks![index].id),
                                ),
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width /
                                      100 *
                                      90,
                                  child: ReviewedBookCard(
                                      googleBook: state.googleBooks![index]),
                                ),
                              ),
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 20),
                          itemCount: state.googleBooks!.length);
                    } else if (state.status ==
                        ReviewsStatus.latestReviewsLoadFailure) {
                      return Center(
                        child: HeaderText(
                            text: 'Sorry but we didn\'t find reviewed books'),
                      );
                    } else {
                      return SizedBox(
                          height: MediaQuery.of(context).size.height / 2,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ));
                    }
                  },
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
