import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../business_logic/cubit/auth_cubit/auth_cubit.dart';

class GoogleButton extends StatelessWidget {
  final String _text;
  const GoogleButton(this._text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: Theme.of(context).primaryColor),
        borderRadius: BorderRadius.all(
          Radius.circular(25.0),
        ),
        boxShadow: [
          BoxShadow(
              color: Color.fromARGB(50, 0, 0, 0),
              spreadRadius: 1,
              blurRadius: 8,
              offset: Offset(0, 3))
        ],
      ),
      child: ElevatedButton(
        onPressed: (() =>
            BlocProvider.of<AuthCubit>(context).logInWithGoogle()),
        child: Row(
          children: [
            Image.asset(
              'assets/Google_Logo.png',
              width: 24,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              _text,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 17, color: Colors.black),
            ),
          ],
        ),
        style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(90))),
          fixedSize: const Size(250, 50),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
