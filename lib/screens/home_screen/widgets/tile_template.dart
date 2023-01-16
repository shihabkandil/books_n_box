import 'package:flutter/material.dart';

class TileTemplate extends StatelessWidget {
  const TileTemplate(
      {super.key,
      required this.icon,
      required this.onTap,
      required this.text,
      this.tail,
      required this.color});

  final Icon? icon, tail;
  final void Function()? onTap;
  final Text text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      tileColor: Theme.of(context).textTheme.bodyMedium?.color!.withOpacity(0.6),
      leading: icon,
      trailing: tail,
      title: text,
      onTap: onTap,
    );
  }
}
