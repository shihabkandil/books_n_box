import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../../shared/widgets/book_card.dart';



class HomeScreenCarousel extends StatelessWidget {
  const HomeScreenCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      child: CarouselSlider.builder(
        itemCount: 5,
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
             BookCard(),
        options: CarouselOptions(
          height: 1200/MediaQuery.of(context).devicePixelRatio,
        autoPlay: true,
        autoPlayCurve: Curves.decelerate,
        disableCenter: true,
        enlargeCenterPage: true,
        viewportFraction: 0.72,
        ),
      ),
    );;
  }
}