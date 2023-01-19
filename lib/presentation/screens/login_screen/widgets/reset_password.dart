import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_app_project/utils/screen_block_size.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key, required this.sizingConfig}) : super(key: key);
  final ScreenBlockSize sizingConfig;

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  late bool isChecked;

  @override
  void initState() {
    super.initState();
    isChecked = false;
  }

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context);

    return Container(
      width: MediaQuery.of(context).size.width / 100 * 80,
      alignment: Alignment.centerRight,
      child: InkWell(
        onTap: () {
          context.go('/reset_password');
        },
        child: Text(
          localization!.reset_password,
          style: GoogleFonts.cairo(
              fontWeight: FontWeight.bold,
              color: Colors.grey,
              fontSize: widget.sizingConfig.verticalBlockSize * 1.6),
        ),
      ),
    );
  }
}
