import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class HomeCatigoriesTitles extends StatefulWidget {
  const HomeCatigoriesTitles({super.key, required this.tabcontroller});

  final TabController tabcontroller;

  @override
  State<HomeCatigoriesTitles> createState() => _HomeCatigoriesTitlesState();
}

class _HomeCatigoriesTitlesState extends State<HomeCatigoriesTitles> {
  var defalutValue;
  var selectedIndex;
  @override
  void initState() {
    super.initState();
    widget.tabcontroller.addListener(
      () {
        setState(
          () {
            selectedIndex = widget.tabcontroller.index;
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context);

    return Container(
      //margin: EdgeInsets.only(left: 30),
      padding: EdgeInsets.only(left: 10, right: 10),
      child: TabBar(
        labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        padding: EdgeInsets.only(left: 30),
        isScrollable: true,
        controller: widget.tabcontroller,
        tabs: [
          Tab(
            text: localization!.fantasy,
          ),
          Tab(
            text: localization.scifi,
          ),
          Tab(
            text: localization.romance,
          ),
          Tab(
            text: localization.selfhelp,
          ),
        ],
        labelColor: Theme.of(context).textTheme.bodyMedium!.color!,
        // add it here
        indicator: RectangularIndicator(
          color: Theme.of(context).primaryColor.withOpacity(0.8),
          bottomLeftRadius: 20,
          bottomRightRadius: 20,
          topLeftRadius: 20,
          topRightRadius: 20,
          horizontalPadding: 5,
          verticalPadding: 1,
          paintingStyle: PaintingStyle.fill,
        ),
      ),
    );
  }
}
