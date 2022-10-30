import 'package:flutter/material.dart';

import '../../shared/widgets/tab_view.dart';

class BooksTabsView extends StatelessWidget {
  const BooksTabsView({super.key , required this.tabController});
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height:700/MediaQuery.of(context).devicePixelRatio,
      child: TabBarView(
          controller:tabController ,
          children: <Widget>[

            BooksTab(),
            BooksTab(),
            BooksTab(),
            BooksTab(),

          ]
      ),
    );;
  }
}