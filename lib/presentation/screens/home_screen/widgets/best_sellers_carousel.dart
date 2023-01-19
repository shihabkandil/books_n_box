import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../../../business_logic/cubit/nyt_best_sellers_cubit/nyt_best_sellers_cubit.dart';
import '../../../../data/models/nytimes_models/nytimes_best_sellers_models/nyt_best_sellers.dart';
import '../../../../utils/enums/books_data_status_enum.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../utils/screen_block_size.dart';
import '../../../shared_widgets/book_card.dart';


class BestSellersCarousel extends StatelessWidget {
  const BestSellersCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context);

    return Container(
      margin: EdgeInsets.only(bottom: 30),
      child: BlocBuilder<NytBestSellersCubit, NytBestSellersState>(
        builder: (context, state) {
          if (state.status == BooksDataStatus.loadingState) {
            return CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            );
          } else if (state.status == BooksDataStatus.booksLoaded && state.books != null) {
            return ResponsiveBuilder(
              builder: (context, sizingInformation) {
                final screenBlocksSize = ScreenBlockSize(screenSizeConfig: sizingInformation);
                return CarouselSlider.builder(
                itemCount: state.books!.length,
                itemBuilder: (BuildContext context, bookIndex, __) {
                  BestSellerBook bestSellerBook = state.books!.elementAt(bookIndex);
                  return BookCard(
                    bestSellerBook: bestSellerBook,
                    imageUrl: bestSellerBook.bookImage,
                    hasBookmarkButton: false,
                  );
                },
                options: CarouselOptions(
                  height: screenBlocksSize.verticalBlockSize * 50,
                  autoPlay: true,
                  autoPlayCurve: Curves.decelerate,
                  disableCenter: true,
                  enlargeCenterPage: true,
                  viewportFraction: 0.72,
                ),
              );
              },
            );
          } else if (state.status == BooksDataStatus.noInternetConnection) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(localization!.connectionLost),
              ),
            );
          }
          return CircularProgressIndicator(
            color: Theme.of(context).primaryColor,
          );
        },
      ),
    );
  }
}
