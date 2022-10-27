import 'package:flutter/material.dart';
import '../../../utils/constants/app_colors.dart';
import 'dart:math' as math;

class HomeTopReviewsGrid extends StatelessWidget {
  const HomeTopReviewsGrid ({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return 
          GridView.builder(

            itemCount: 8,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2 , mainAxisSpacing: 4 , crossAxisSpacing: 4,) ,

            itemBuilder:(context, index) => Material(

            borderRadius:const BorderRadius.all(Radius.circular(20)),
            elevation: 3.5,

            child: Container(
                 padding: const EdgeInsets.all(5),
                 decoration: const BoxDecoration(
                 color: Colors.white,
                 borderRadius: BorderRadius.all(Radius.circular(20))
                ),
    
                  child: Column(
                    
                    children: [
                      
                         Align(
                           alignment: Alignment.topRight,
                           child: Container(
                              width: 30, 
                              height: 20,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.favorite_color,
                              ),
                              child: IconButton(
                                padding: const EdgeInsets.all(3),
                                iconSize: 15,
                                icon:const Icon(Icons.favorite,color: Colors.white), onPressed: () {  },
                                )
                                ),
                            ), 
                      
                          Stack(
                              
                              alignment: Alignment.center,
                              
                              
                              children: [

                                    Transform.rotate(
                                      angle:  -math.pi / 4,
                                      child: Opacity(
                                        opacity: 0.2,
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            color: Color.fromARGB(255, 9, 215, 208),
                                            borderRadius: BorderRadius.all(Radius.circular(20))
                                          ),
                                          width: 100,
                                          height: 100,
                                        ),
                                      ),
                                    ),

                                    Transform.rotate(

                                     angle:  -math.pi / 12,
                                      child: SizedBox(
                                      height: 105,
                                      child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                     child: Image.asset("assets/images/All_The_Light.jpg")
                                      ),
                                    ),
                                  ),

                              ],
                            ),
                            const SizedBox(height: 15),
                            Container(
                              padding: const EdgeInsets.only(left: 5),
                              child: const Align(
                                alignment: Alignment.center,
                                child: Text("Book Name"),
                                ),
                              ),
                                Align(
                                  alignment: Alignment.center,
                                  child: SizedBox(
                                    width: 120,
                                    child: Row(
                                        children: const [
                                          Icon(Icons.star,color: Colors.yellow,),
                                          Icon(Icons.star,color: Colors.yellow,),
                                          Icon(Icons.star,color: Colors.yellow,),
                                          Icon(Icons.star,color: Colors.yellow,),
                                          Icon(Icons.star,color: Colors.yellow,),
                                        ],
                                      ),
                                  ),
                                ),
                    ]),
                ),
          ),

        );
  }
}