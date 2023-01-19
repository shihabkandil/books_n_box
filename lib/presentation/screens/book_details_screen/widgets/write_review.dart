import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../../../business_logic/cubit/reviews_cubit/reviews_cubit.dart';
import '../../../../utils/screen_block_size.dart';
import '../../../shared_widgets/button.dart';
import '../../../shared_widgets/header_text.dart';
import 'review_text_field.dart';

class WriteReview extends StatefulWidget {
  const WriteReview(
      {Key? key,
      required this.onClosePressed,
      required ScreenBlockSize screenBlockSize})
      : super(key: key);
  final VoidCallback onClosePressed;

  @override
  State<WriteReview> createState() => _WriteReviewState();
}

class _WriteReviewState extends State<WriteReview> {
  String reviewText = '';

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        final ScreenBlockSize screenBlockSize =
            ScreenBlockSize(screenSizeConfig: sizingInformation);
        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: screenBlockSize.horizontalBlockSize * 5),
          child: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Divider(
                    height: screenBlockSize.verticalBlockSize * 4,
                    color: Colors.white54,
                    thickness: 1,
                    indent: screenBlockSize.horizontalBlockSize * 20,
                    endIndent: screenBlockSize.horizontalBlockSize * 20),
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: screenBlockSize.horizontalBlockSize * 2,
                      vertical: screenBlockSize.horizontalBlockSize * 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      HeaderText(
                          text: AppLocalizations.of(context)!.write_a_review,
                          color: Colors.orangeAccent,
                          fontWeight: FontWeight.w500),
                      IconButton(
                        onPressed: widget.onClosePressed,
                        icon: Icon(Icons.close),
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                ReviewTextField(
                  maxTextLength: 150,
                  onChanged: (text) => reviewText = text,
                ),
                Button(
                  text: AppLocalizations.of(context)!.submit_review,
                  onPressed: () => BlocProvider.of<ReviewsCubit>(context)
                      .submitReview(review: reviewText),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
