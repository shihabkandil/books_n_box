import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../business_logic/cubit/google_books_cubit/google_books_cubit.dart';
import 'package:mobile_app_project/utils/enums/books_data_status_enum.dart';
import '../../widgets/books_details.dart';
import '../../widgets/tab_view.dart';

class BooksTabsView extends StatefulWidget {
  BooksTabsView({super.key, required this.tabController});
  final TabController tabController;
  Duration sleep = Duration(milliseconds: 5);
  @override
  State<BooksTabsView> createState() => _BooksTabsViewState();
}

class _BooksTabsViewState extends State<BooksTabsView> {

  Map<String, List> currentBookStates = {"fantasy": [], "romance": [], "science+fiction": [], "self+help": []};

  @override
  void initState() {
    super.initState();
    BlocProvider.of<GoogleBooksCubit>(context).genreBookresults();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GoogleBooksCubit, GoogleBooksState>(
      builder: (context, state) {
        if (state.status == BooksDataStatus.booksLoaded) {
          currentBookStates = state.genreBooks!;
          // print('books loaded with information');
        } else {
          currentBookStates = {"fantasy": [], "romance": [], "science+fiction": [], "self+help": []};
          // print('empty books loaded');
        }
        return Container(
          height: 700 / MediaQuery.of(context).devicePixelRatio,
          child: TabBarView(
            controller: widget.tabController,
            children: <Widget>[
              BooksTab(books: currentBookStates['fantasy']!),
              BooksTab(books: currentBookStates['romance']!),
              BooksTab(books: currentBookStates['science+fiction']!),
              BooksTab(books: currentBookStates['self+help']!),
            ],
          ),
        );
      },
    );
  }
}
