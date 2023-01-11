import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    var localization = AppLocalizations.of(context);
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
            localization!.acceptTerms,
            style:
                TextStyle(fontSize: 12, color: Theme.of(context).textTheme.bodyMedium?.color),
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
      ElevatedButton(
          onPressed: agree
              ? () {
                  if (widget._formKey.currentState.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(localization.processingData)));
                  }
                }
              : null,
          child: Text(localization.contin))
    ]);
  }
}
