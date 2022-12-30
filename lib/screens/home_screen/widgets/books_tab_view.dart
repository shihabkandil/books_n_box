import 'dart:io';

import 'package:flutter/material.dart';
import '../../widgets/books_details.dart';
import '../../widgets/tab_view.dart';

class BooksTabsView extends StatefulWidget {
  BooksTabsView({super.key, required this.tabController});
  List<String?> books = [null, null, null, null];
  final TabController tabController;
  Duration sleep = Duration(milliseconds: 5);
  @override
  State<BooksTabsView> createState() => _BooksTabsViewState();
}

class _BooksTabsViewState extends State<BooksTabsView> {
  var books = {'fantasy': [], 'romance': [], 'science+fiction': [], 'self+help': []};
  void indexName() async {
    List<String> GenreName = ['fantasy', 'science+fiction', 'romance', 'self+help'];
    books['fantasy'] = await GoogleApi().gbsApiCall(GenreName[0]);
    sleep(widget.sleep);
    books['romance'] = await GoogleApi().gbsApiCall(GenreName[1]);
    sleep(widget.sleep);
    books['science+fiction'] = await GoogleApi().gbsApiCall(GenreName[2]);
    sleep(widget.sleep);
    books['self+help'] = await GoogleApi().gbsApiCall(GenreName[3]);
    setState(() {
    });
  }

  @override
  void initState() {
    super.initState();
    indexName();
  }

  @override
  Widget build(BuildContext context) {
    // className.fucntion(GenreName)
    return Container(
      height: 700 / MediaQuery.of(context).devicePixelRatio,
      child: TabBarView(
        controller: widget.tabController,
        children: <Widget>[
          BooksTab(books: books['fantasy']!),
          BooksTab(books: books['romance']!),
          BooksTab(books: books['science+fiction']!),
          BooksTab(books: books['self+help']!),
        ],
      ),
    );
  }
}
