
import 'package:flutter/material.dart';

class BackIconButton extends StatelessWidget {
  const BackIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(6),
      child: Ink(
        decoration: ShapeDecoration(
            color: Theme.of(context).primaryColor,
            shape: CircleBorder()
          ),
          child: IconButton(
            icon: Icon(Icons.arrow_back_rounded,),
            color: Colors.white,
            onPressed: ()=>Navigator.pop(context),
          ),
        ),
    );
  }
}