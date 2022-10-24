import 'package:flutter/material.dart';
import '../../shared/widgets/app_bottom_navigator.dart';
import '../widgets/api_tabbar.dart';
import '../widgets/header_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

  
    return SafeArea(

      child: Scaffold(
        extendBody: true,
        backgroundColor: const Color(0xFFF3F3FF),

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
                Container(padding: const EdgeInsets.all(10),child: const HeaderText(text: "Choose Source")),
                const ApiTabbar(),
             ], 
           ),
         ),

        bottomNavigationBar: const AppBottomNavigator(),

    )
    );
  }
}
