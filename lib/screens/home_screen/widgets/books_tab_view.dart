import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app_project/business_logic/cubit/bookmarks_cubit/bookmarks_cubit.dart';
import '../../../business_logic/cubit/google_books_cubit/google_books_cubit.dart';
import 'package:mobile_app_project/utils/enums/books_data_status_enum.dart';
import '../../widgets/tab_view.dart';

class BooksTabsView extends StatelessWidget {
  BooksTabsView({super.key, required this.tabController});
  final TabController tabController;
  Duration sleep = Duration(milliseconds: 5);
  Map<String, List> currentBookStates = {
    "fantasy": [],
    "romance": [],
    "science+fiction": [],
    "self+help": []
  };

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GoogleBooksCubit, GoogleBooksState>(
      builder: (context, state) {
        if (state.status == BooksDataStatus.booksLoaded) {
          currentBookStates = state.genreBooks!;
          return Container(
            height: 700 / MediaQuery.of(context).devicePixelRatio,
            child: BlocProvider(
              create: (context) => BookmarksCubit(),
              child: TabBarView(
                  controller: tabController,
                  children: <Widget>[
                    BooksTab(books: currentBookStates['fantasy']!),
                    BooksTab(books: currentBookStates['science+fiction']!),
                    BooksTab(books: currentBookStates['romance']!),
                    BooksTab(books: currentBookStates['self+help']!),
                  ],
                )
               ));
              }
         else if(state.status == BooksDataStatus.loadingState){
          return Center(child: CircularProgressIndicator(),);
        }else{
          return Center(child: Text("Books Not Retrived !!"),);
        }
      },
    );
  }
}
