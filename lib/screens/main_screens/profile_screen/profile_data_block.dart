import 'package:flutter/material.dart';
import 'package:mobile_app_project/screens/main_screens/profile_screen/profile_avatar_name.dart';
import 'package:mobile_app_project/screens/main_screens/profile_screen/profile_statistics.dart';

class ProfileDataBlock extends StatelessWidget {
  const ProfileDataBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      
            padding:EdgeInsets.all(10) ,
            
              child: Material(

                borderRadius:BorderRadius.all(Radius.circular(20)),
                elevation: 7,

                child: Container(
              
                  alignment: Alignment.topCenter,
                  height: 200,
                  width: 400,
                   decoration: BoxDecoration(
                   color: Color.fromARGB(255, 232, 228, 228),
                   borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                
                  child: Padding(
                    padding: EdgeInsets.all(10),
              
                    child: Align(
                      alignment: Alignment.center,
              
                      child: Column(
                
                        children: [
              
                           ProfileAvatarName(),
                      
                           SizedBox(height: 15,),

                           ProfileStatistics(),
              
                        ],
                      ),
              
                    ),
                  ),
              
                ),
              ),
              
          );
  }
}