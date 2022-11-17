import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../widgets/book_card.dart';

class SimilarBooksCarousel extends StatelessWidget {
  const SimilarBooksCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      child: CarouselSlider.builder(
        itemCount: 5,
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
            BookCard(),
        options: CarouselOptions(
            height: 550 / MediaQuery.of(context).devicePixelRatio,
            autoPlay: true,
            autoPlayCurve: Curves.decelerate,
            viewportFraction: 0.4),
      ),
    );
  }
}
