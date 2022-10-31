import 'package:flutter/material.dart';

class GridBackGround extends StatelessWidget {
  final double var_height;
  const GridBackGround({this.var_height = 600, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: var_height,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 232, 228, 228),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
    );
  }
}
