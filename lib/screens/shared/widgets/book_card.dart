import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_app_project/dummy.dart';



class BookCard extends StatelessWidget {
  const BookCard({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return  Container(
        width: 440/MediaQuery.of(context).devicePixelRatio,
      padding: EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),
      margin: EdgeInsets.all(8),
      child: InkWell(
        onTap: ()=>context.go('/home/book_details'),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),

           child: CachedNetworkImage(
            fit:  BoxFit.fill,
            imageUrl:Dummy.chooseRand(),
            placeholder: (context, url) => Center(child: CircularProgressIndicator(color: Colors.red)),
             errorWidget: (context, url, error) => Icon(Icons.error),
             )
             
        ),
      )
    );
  }
}