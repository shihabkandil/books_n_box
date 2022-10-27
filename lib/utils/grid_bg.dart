import 'package:flutter/material.dart';


class GridBackGround extends StatelessWidget {
  const GridBackGround({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
              height: 600,

              decoration: BoxDecoration(
                 color: Color.fromARGB(255, 232, 228, 228),
                 borderRadius: BorderRadius.only(topLeft: Radius.circular(20) , topRight: Radius.circular(20)),
                )
                );
  }
}