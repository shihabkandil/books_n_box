import 'package:flutter/material.dart';
import 'package:mobile_app_project/screens/Settings%20Screen/widgets/lang_btn.dart';
import 'package:mobile_app_project/screens/home_screen/widgets/tile_template.dart';
import 'package:switcher_button/switcher_button.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,

      body:
      Container(
      margin:EdgeInsets.only(top: 65,left: 35,right: 40),
      child: Column(
      children: [

        Text("Settings",style: TextStyle(
            fontWeight: FontWeight.w500,
        fontSize: 40,
        color: Colors.white
          ),
        ),
        
        SizedBox(height: 30,),

        Row(children: [

          Container(
            padding: EdgeInsets.only(left: 30),
            child: Text("Language",style: TextStyle(
            fontSize: 16,
            color: Colors.white
              ),
            ),
          ),

          Container(padding: EdgeInsets.only(left: 95),child: LangBtn()),
        ],
          
        ),

        SizedBox(height: 20,),

        Row(children: [

          Container(
          padding: EdgeInsets.only(left: 26),
          child: Text("App Theme",style: TextStyle(
          fontSize: 16,
          color: Colors.white
            ),
          ),
        ),

        SizedBox(width: 150,),

             Container(
          child: SwitcherButton(
               value: true,
          onChange: (value) {
          print(value);
          },
               ),
        ),

        ],),

     


        SizedBox(height: 300,),
        Container(
          padding: EdgeInsets.only(right: 250),
          child: Text("Help",style: TextStyle(
          fontSize: 16,
          color: Colors.white
            ),
          ),
        ),
        SizedBox(height: 20,),
        TileTemplate(icon: Icon(Icons.question_mark_sharp,color: Colors.white), callback: (){}, text: Text("FAQ",style: TextStyle(color: Colors.white)), color: Colors.white.withOpacity(0.7)),
        SizedBox(height: 20,),
        TileTemplate(icon: Icon(Icons.lock,color: Colors.white), callback: (){}, text: Text("Our Privacy Policy",style: TextStyle(color: Colors.white)), color: Colors.white.withOpacity(0.7)),
        
       
     ],
      ),
      ));
  }
}