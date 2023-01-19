import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BackArrow extends StatelessWidget {
  const BackArrow({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
                icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).textTheme.bodyMedium!.color,
          ),
          onPressed: () {
            context.pop();
          },
        
    );
  }
}