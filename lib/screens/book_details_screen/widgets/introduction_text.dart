import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class IntroductionText extends StatelessWidget {
  const IntroductionText({Key? key,required this.introductionText}) : super(key: key);
  final String introductionText;

  @override
  Widget build(BuildContext context) {
    String dumy = "fdfds sudif sdf sdoif sdoif sdfodhsoydgfdpf dsf dhsufsdifhdsifh sduifh sdufh sdfsdh fisudhfsdfweiofjdsk h hfsduf odisf hsdh f;dsif sdoi fsdfusdhf;sdoifew we io hfiodh;sdo hfsd fshdiofwehw ;eoifhsdfh sdohf sdoi sdfsdhfsd hisdfods hjsdoi h";
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      alignment: Alignment.centerLeft,
      child: ReadMoreText('$dumy',
        trimLines: 3,
        trimMode: TrimMode.Line,
        trimCollapsedText: 'Read more',
        trimExpandedText: 'Read less',
        style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 18,
            color: Colors.grey
        ),
        lessStyle:  TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: Theme.of(context).primaryColor
        ),
        moreStyle: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: Theme.of(context).primaryColor
        ),
      ),
    );
  }
}
