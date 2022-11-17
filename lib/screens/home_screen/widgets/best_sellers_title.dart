import 'package:flutter/material.dart';

class BestSellersTitle extends StatelessWidget {
  const BestSellersTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 35, bottom: 15, left: 30),
      alignment: Alignment.centerLeft,
      child: Text(
        "Best Sellers",
        style: TextStyle(
            fontWeight: FontWeight.w400, fontSize: 23, color: Colors.white),
      ),
    );
  }
}
