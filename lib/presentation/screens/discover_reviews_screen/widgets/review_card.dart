import 'package:flutter/material.dart';
import 'package:mobile_app_project/utils/screen_block_size.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../../shared_widgets/header_text.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard(
      {Key? key,
      required this.userImageUrl,
      required this.review,
      required this.userName})
      : super(key: key);
  final String userImageUrl;
  final String review;
  final String userName;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        final ScreenBlockSize screenBlockSize =
            ScreenBlockSize(screenSizeConfig: sizingInformation);
        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: screenBlockSize.horizontalBlockSize * 4,
              vertical: screenBlockSize.verticalBlockSize * 1),
          child: Material(
            color: Colors.cyan.shade50,
            elevation: 5,
            borderRadius:
                BorderRadius.circular(screenBlockSize.verticalBlockSize * 2),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: screenBlockSize.horizontalBlockSize * 4,
                  vertical: screenBlockSize.verticalBlockSize * 1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        foregroundImage: NetworkImage(userImageUrl),
                      ),
                      SizedBox(
                        width: screenBlockSize.horizontalBlockSize * 1,
                      ),
                      (userName.split(" ").length >= 2)
                          ? HeaderText(
                              text: userName.split(" ").elementAt(0) +
                                  ' ' +
                                  userName.split(" ").elementAt(1),
                              color:
                                  Theme.of(context).textTheme.bodyMedium?.color,
                              fontWeight: FontWeight.w500,
                            )
                          : HeaderText(text: userName.split(" ").elementAt(0))
                    ],
                  ),
                  Divider(),
                  HeaderText(
                    text: review,
                    color: Theme.of(context).textTheme.bodyMedium?.color,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
