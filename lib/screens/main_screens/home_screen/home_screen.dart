import 'package:flutter/material.dart';
import 'package:mobile_app_project/screens/main_screens/home_screen/api_tabbar.dart';
import 'package:mobile_app_project/screens/main_screens/home_screen/header_text.dart';
import 'package:mobile_app_project/screens/shared/widgets/app_bottom_navigator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

  
    return SafeArea(

      child: Scaffold(
        extendBody: true,
        backgroundColor: Color(0xFFF3F3FF),

        appBar: PreferredSize(preferredSize: const Size.fromHeight(60),
          child: AppBar(
        
            backgroundColor: const Color.fromARGB(255, 24, 4, 243),
            flexibleSpace: Image.asset('assets/images/Logo White.png',),
            leading: const IconButton(icon: Icon(Icons.settings,color: Colors.white,), onPressed: null,),
            // ignore: prefer_const_literals_to_create_immutables
            actions: [
              const IconButton(
                 onPressed: null,
                 icon: Icon(Icons.search,color: Colors.white,),
                ),
            ],
            
          ),
        ),

        body:
         SingleChildScrollView(
           physics: const NeverScrollableScrollPhysics(),
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
             children :[
                Container(padding: EdgeInsets.all(10),child: HeaderText(text: "Choose Source")),
                ApiTabbar(),
             ], 
           ),
         ),

        bottomNavigationBar: const AppBottomNavigator(),

    )
    );
  }
}
