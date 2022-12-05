import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app_project/data/models/nytimes_models/nytimes_best_sellers_models/nyt_best_sellers.dart';
import '../../../business_logic/cubit/nyt_best_sellers_cubit/nyt_best_sellers_cubit.dart';
import '../../../utils/enums/books_data_status_enum.dart';
import '../../widgets/book_card.dart';

class HomeScreenCarousel extends StatelessWidget {
  const HomeScreenCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      child: BlocBuilder<NytBestSellersCubit, NytBestSellersState>(
        builder: (context, state) {
          if (state.status == BooksDataStatus.initialState) {
            return CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            );
          }
          else if (state.status == BooksDataStatus.booksLoaded && state.books != null) {
            return CarouselSlider.builder(
              itemCount: state.books!.length,
              itemBuilder: (BuildContext context, bookIndex, __) {
                BestSellerBook bestSellerBook = state.books!.elementAt(bookIndex);
                return BookCard(imageUrl: bestSellerBook.bookImage);
              },
              options: CarouselOptions(
                height: 1200 / MediaQuery.of(context).devicePixelRatio,
                autoPlay: true,
                autoPlayCurve: Curves.decelerate,
                disableCenter: true,
                enlargeCenterPage: true,
                viewportFraction: 0.72,
              ),
            );
          }
          else if (state.status == BooksDataStatus.noInternetConnection) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Lost connection'),
              ),
            );
          }
          return CircularProgressIndicator(color: Theme.of(context).primaryColor,);
        },
      ),
    );
  }
}
