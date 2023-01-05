import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobile_app_project/business_logic/cubit/google_books_cubit/google_books_cubit.dart';
import 'package:mobile_app_project/utils/enums/books_data_status_enum.dart';

class SearchWithText extends StatelessWidget {
  const SearchWithText({super.key, required this.text});
  final String text;
  
  @override
  Widget build(BuildContext context) {
     var localization = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(title: Text("Search Results for: "+text), backgroundColor: Colors.transparent,centerTitle: true,),

      body: BlocBuilder<GoogleBooksCubit , GoogleBooksState>(
        builder:(context, state) {
          if(state.status == BooksDataStatus.initialState){
            return Center(child: CircularProgressIndicator());
          }else if(state.status == BooksDataStatus.booksLoaded){
            return ListView.separated(
              padding: EdgeInsets.symmetric(vertical: 10 , horizontal: 10),
              separatorBuilder:(context, index) => SizedBox(height: 15,),
              itemCount: state.books?.length ?? 0,
              itemBuilder: (context, index) {
              
              final title = state.books?.elementAt(index).volumeInfo?.title;
              final imgUrl = state.books?.elementAt(index).volumeInfo?.imageLinks?.small;
              final rating = state.books?.elementAt(index).volumeInfo?.averageRating;

              return ListTile(
              shape:RoundedRectangleBorder(side:BorderSide(width: 2),borderRadius: BorderRadius.circular(50)) ,
              tileColor: Color.fromARGB(255, 31, 44, 60),
              leading: (imgUrl !=null )?SizedBox(height: 50 , width: 50,child: Image.network(imgUrl)):SizedBox(height: 50 , width: 50,child: Image.asset("assets/images/defaultcover.png")),
              title: Text( title ?? "not speceficed" , style: TextStyle(color: Colors.white),),
              subtitle:(rating !=null )?Text(rating.toString(),style: TextStyle(color: Colors.yellow)):Text("No Rating Provided" , style: TextStyle(color: Colors.yellow),),
              trailing: IconButton(onPressed: (){},icon:Icon(Icons.bookmark_add_outlined , color: Colors.white,)),
              );
            },);
          }else if(state.status == BooksDataStatus.noDataReceived){
            return Center(child: Text("No Results for Search Term: "+text , style: TextStyle(color: Colors.white),));
          }else{
            return Center(child: Text("ERROR !!" , style: TextStyle(color: Colors.red),));
          }
        },

      ),
      
    );
    
  }
}