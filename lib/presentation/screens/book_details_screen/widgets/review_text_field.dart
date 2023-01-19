import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app_project/business_logic/cubit/reviews_cubit/reviews_cubit.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../../../utils/screen_block_size.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ReviewTextField extends StatelessWidget {
  const ReviewTextField(
      {Key? key,
      required this.maxTextLength,
      required this.onChanged})
      : super(key: key);

  final int maxTextLength;
  final Function(String text) onChanged;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        final screenBlockSize =
            ScreenBlockSize(screenSizeConfig: sizingInformation);
        return AutoSizeTextField(
          controller: TextEditingController(),
          decoration: InputDecoration(
            fillColor: Colors.grey.shade900,
            filled: true,
            errorText: (BlocProvider.of<ReviewsCubit>(context,listen: true).state.status ==
                    ReviewsStatus.submittedReviewCantBeEmpty)
                ? AppLocalizations.of(context)?.cant_be_empty
                : null,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                    screenBlockSize.verticalBlockSize * 1.4),
                borderSide: BorderSide(
                    width: screenBlockSize.horizontalBlockSize * 0.1)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                  screenBlockSize.verticalBlockSize * 1.4),
            ),
            counterStyle: TextStyle(
                fontSize: screenBlockSize.verticalBlockSize * 2,
                color: Colors.black),
          ),
          style: TextStyle(fontSize: screenBlockSize.verticalBlockSize * 2),
          minLines: 1,
          maxLines: 5,
          maxLength: maxTextLength,
          onChanged: (value) => onChanged(value),
        );
      },
    );
  }
}
