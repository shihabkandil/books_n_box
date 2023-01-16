import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../data/models/google_books/google_book.dart';
import '../../widgets/back_icon_button.dart';

class ScreenBar extends StatelessWidget {
  final String? bookName;
  final String? imageUrl;
  const ScreenBar({super.key,this.bookName,this.imageUrl});


  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).backgroundColor,
      expandedHeight: 300,
      flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          title: Container(
            padding: EdgeInsets.all(15),
            child: Text(
              bookName!,
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  fontSize: 18),
            ),
          ),
          background: Stack(
            fit: StackFit.expand,
            children: [
              Container(
               child: CachedNetworkImage(
                  imageUrl: imageUrl!,
                 fit: BoxFit.cover,
               ),
              ),
              Container(
                width: double.infinity,
                decoration: new BoxDecoration(
                  gradient: new LinearGradient(
                    tileMode: TileMode.clamp,
                    begin: const Alignment(0.0, 1),
                    end: const Alignment(0.0, 0),
                    colors: <Color>[
                      const Color(0xFF000000),
                      Colors.black12.withOpacity(0.0)
                    ],
                  ),
                ),
              ),
            ],
          )),
      leading: BackIconButton(),
      leadingWidth: 90,
    );
  }
}
