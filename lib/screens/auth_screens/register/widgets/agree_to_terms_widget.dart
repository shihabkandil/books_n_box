import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AgreeToTerms extends StatefulWidget {
  const AgreeToTerms(this._formKey, {super.key});
  final _formKey;
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
          onPressed: agree
              ? () {
                  if (widget._formKey.currentState.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Processing Data')));
                  }
                }
              : null,
          child: const Text('Continue'))
    ]);
  }
}
