import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobile_app_project/screens/my_shelf_screen/widgets/book_image.dart';
import 'package:mobile_app_project/screens/my_shelf_screen/widgets/single_book_details.dart';

import '../../business_logic/cubit/bookmarks_cubit/bookmarks_cubit.dart';
import '../../utils/enums/bookarks_enum.dart';
import '../widgets/back_icon_button.dart';

class MyShelfScreen extends StatefulWidget {
  const MyShelfScreen({super.key});

  @override
  State<MyShelfScreen> createState() => _MyShelfScreenState();
}

class _MyShelfScreenState extends State<MyShelfScreen> {
  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context);
    BlocProvider.of<BookmarksCubit>(context).getAllBookmarkedBooks();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 1,
        leading: BackIconButton(),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        child: Column(
          children: [
            Text(
              textAlign: TextAlign.center,
              localization!.myshelf,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 40,
                  color: Theme.of(context).textTheme.bodyMedium?.color),
            ),
            SizedBox(
              height: 50,
            ),
            BlocBuilder<BookmarksCubit, BookmarksState>(
              builder: (context, state) {
                if ((state.status == BookmarkStatus.notBookmarked ||
                        state.status == BookmarkStatus.syncedBookmarks) &&
                    state.bookmarkedBooks != null) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: state.bookmarkedBooks?.length,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            BookImage(
                                thumbnailLink: state.bookmarkedBooks![index]
                                    .volumeInfo!.imageLinks!.thumbnail!),
                            SingleBookDetail(
                                bookDetails: state.bookmarkedBooks![index]),
                          ],
                        );
                      },
                    ),
                  );
                } else if (state.status == BookmarkStatus.fetchingBookmarks) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [CircularProgressIndicator()],
                    ),
                  );
                } else {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text("No bookmarks yet")],
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}