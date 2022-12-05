import 'package:flutter/material.dart';

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
