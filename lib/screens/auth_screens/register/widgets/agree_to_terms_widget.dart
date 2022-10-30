import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AgreeToTerms extends StatefulWidget {
  const AgreeToTerms({super.key});

  @override
  State<AgreeToTerms> createState() => _AgreeToTermsState();
}

class _AgreeToTermsState extends State<AgreeToTerms> {
  bool agree = false;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Material(
            color: Theme.of(context).backgroundColor,
            child: Checkbox(
              fillColor: MaterialStateProperty.all(Colors.blue),
              value: agree,
              onChanged: (value) {
                setState(() {
                  agree = value ?? false;
                });
              },
            ),
          ),
          Text(
            'I have read and accept terms and conditions',
              style: TextStyle(fontSize: 12,color: Colors.white.withOpacity(0.8)),
              overflow: TextOverflow.ellipsis,
          )
        ],
      ),
      ElevatedButton(
          onPressed: agree ? () {} : null, child: const Text('Continue',style: TextStyle(color: Colors.white),),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
        ),)
    ]);
  }
}
