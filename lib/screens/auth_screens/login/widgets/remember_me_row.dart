import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app_project/utils/screen_block_size.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RememberMeRow extends StatefulWidget {
  const RememberMeRow({Key? key, required this.sizingConfig, required this.onCheckChanged}) : super(key: key);
  final ScreenBlockSize sizingConfig;
  final ValueChanged<bool> onCheckChanged;

  @override
  State<RememberMeRow> createState() => _RememberMeRowState();
}

class _RememberMeRowState extends State<RememberMeRow> {
  late bool isChecked;

  @override
  void initState() {
    super.initState();
    isChecked = false;
  }

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
              side: BorderSide(color: Colors.white),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      widget.sizingConfig.horizontalBlockSize * 1.5),side: BorderSide(color: Colors.white)),
              visualDensity: VisualDensity.compact,
              onChanged: (value) {
                widget.onCheckChanged(value ?? false);
                setState(() {
                  isChecked = value ?? false;
                });
              },
              value: isChecked,
            ),
            Text(localization!.rememberMe,
                style: TextStyle(
                  fontSize: widget.sizingConfig.verticalBlockSize * 2,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
            ),
          ],
        ),
        Text(
          localization.forgotPass,
          style: GoogleFonts.cairo(
              fontWeight: FontWeight.bold,
              color: Colors.grey,
              fontSize: widget.sizingConfig.verticalBlockSize * 1.6),
        ),
      ],
    );
  }
}
