import 'package:flutter/material.dart';

class ProfileStatistics extends StatelessWidget {
  const ProfileStatistics({super.key});

  @override
  Widget build(BuildContext context) {
    return 
                            Container(
                                width: 200,
                                height: 40,
                                
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
              
                                  children: [
              
                                    Column(
                                      children: [
                                       Text("50",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black)),
                                       Text("My Books",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black)),
                                      ],
                                    ),
                                    
                                    VerticalDivider(
                                      color: Colors.black,
                                    ),
              
                                    Column(
                                      children: [
                                       Text("0",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black)),
                                       Text("Followers",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black)),
                                      ],
                                    ),
              
                                  ],
              
                                ),
                            );
  }
}