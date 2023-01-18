import 'package:flutter/material.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.bottomRight,
        child: IconButton(
          onPressed: () {},
          icon: Icon(Icons.favorite),
          iconSize: 24,
          color: Colors.red,
        ),
      ),
    );
  }
}
