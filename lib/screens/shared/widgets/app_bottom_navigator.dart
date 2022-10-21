import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../utils/bottom_bar_custompainter.dart';

class AppBottomNavigator extends StatelessWidget {
  const AppBottomNavigator({super.key});

  @override
  Widget build(BuildContext context) {

    final Size size = MediaQuery.of(context).size;
    
    return SizedBox(
              width: size.width,
              height: 80,
              child: Stack(
                children: [

                  CustomPaint(
                    size: Size(size.width,80),
                    painter: BNBCustomPainter(borderColor: Colors.black , borderThickness: 0.3) ,
                  ),

                  Center(
                      heightFactor: 0.6,
                      child: FloatingActionButton(onPressed: ()async{
                      final ImagePicker _picker = ImagePicker();
                      final XFile? photo = await _picker.pickImage(source: ImageSource.camera);},
                      backgroundColor: const Color.fromARGB(255, 13, 5, 233),
                      child: const Icon(Icons.camera_alt),elevation: 0.1,),
                  ),

                  SizedBox(
                    width: size.width,
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const IconButton(onPressed: null, icon: Icon(Icons.home,color: Colors.black,)),
                        const IconButton(onPressed: null, icon: Icon(Icons.favorite,color: Colors.black,)),
                        Container(width: size.width*0.20,),
                        const IconButton(onPressed: null, icon: Icon(Icons.menu_book_sharp,color: Colors.black,)),
                        const IconButton(onPressed: null, icon: Icon(Icons.person,color: Colors.black,)),
                    ]),
                  )

                ],

              ),
            );
  }
}