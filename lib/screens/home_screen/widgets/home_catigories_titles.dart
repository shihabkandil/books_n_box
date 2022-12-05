import 'package:flutter/material.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class HomeCatigoriesTitles extends StatelessWidget {
  const HomeCatigoriesTitles({super.key , required this.tabcontroller});

  final TabController tabcontroller;
  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.only(left: 30),
      padding: EdgeInsets.only(left: 10,right: 10),
      child: TabBar(
        labelStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500
        ),
        padding: EdgeInsets.only(left: 30),
        isScrollable: true,
        controller: tabcontroller,
        tabs: [
          Tab(
              text: "Discover",
          ),
          Tab(
            text: "Popular",
          ),
          Tab(
            text: "Top-Rated",
          ),
          Tab(
            text: "Upcoming",
          ),
        ],
        labelColor: Colors.white,
        // add it here
        indicator: RectangularIndicator(
          color: Theme.of(context).primaryColor,
          bottomLeftRadius: 20,
          bottomRightRadius: 20,
          topLeftRadius: 20,
          topRightRadius: 20,
          horizontalPadding: 5,
          verticalPadding: 1,
          paintingStyle: PaintingStyle.fill,
        ),
      ),
    );
  }
}