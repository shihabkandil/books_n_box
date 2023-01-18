import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobile_app_project/screens/my_shelf_screen/widgets/book_image.dart';
import 'package:mobile_app_project/screens/my_shelf_screen/widgets/single_book_details.dart';

import '../widgets/back_icon_button.dart';

class MyShelfScreen extends StatelessWidget {
  const MyShelfScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 1,
        leading: BackIconButton(),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        child: Column(
          children: [
            Text(
              textAlign: TextAlign.center,
              localization!.myshelf,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 40, color: Theme.of(context).textTheme.bodyMedium?.color),
            ),
            SizedBox(
              height: 50,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      BookImage(),
                      SingleBookDetail(),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
