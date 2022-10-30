import 'package:flutter/material.dart';

class TileTemplate extends StatelessWidget {
  const TileTemplate({super.key , required this.icon , required this.callback , required this.text , this.tail , required this.color});

  final Icon? icon,tail;
  final VoidCallback callback;
  final Text text;
  final Color color;
  


  @override
  Widget build(BuildContext context) {
    return ListTile(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                 Radius.circular(20)
              )
            ), 

            tileColor: color,
            leading:icon,
            trailing: tail,
            title: text,
            onTap: callback,
          );
  }
}