import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../business_logic/cubit/reviews_cubit/reviews_cubit.dart';
import '../../../../utils/screen_block_size.dart';
import '../../../shared_widgets/button.dart';
import 'write_review.dart';

enum WidgetIndex { first, second }

class ReviewSwitcher extends StatefulWidget {
  const ReviewSwitcher({Key? key}) : super(key: key);

  @override
  State<ReviewSwitcher> createState() => _ReviewSwitcherState();
}

class _ReviewSwitcherState extends State<ReviewSwitcher> {
  WidgetIndex currentWidget = WidgetIndex.first;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      final screenBlockSize =
          ScreenBlockSize(screenSizeConfig: sizingInformation);
      return (currentWidget == WidgetIndex.first)
          ? Button(
              margin: EdgeInsets.symmetric(
                  horizontal: screenBlockSize.horizontalBlockSize * 15),
              text: AppLocalizations.of(context)!.write_a_review,
              onPressed: () => setState(() {
                currentWidget = WidgetIndex.second;
              }),
            )
          : WriteReview(
              screenBlockSize: screenBlockSize,
              onClosePressed: () => setState(() {
                BlocProvider.of<ReviewsCubit>(context, listen: false)
                    .resetValidatorState();
                currentWidget = WidgetIndex.first;
              }),
            );
    });
  }
}
