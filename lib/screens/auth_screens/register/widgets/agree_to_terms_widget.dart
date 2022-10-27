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
            child: Checkbox(
              value: agree,
              onChanged: (value) {
                setState(() {
                  agree = value ?? false;
                });
              },
            ),
          ),
          const Text(
            'I have read and accept terms and conditions',
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
      ElevatedButton(
          onPressed: agree ? () {} : null, child: const Text('Continue'))
    ]);
  }
}
