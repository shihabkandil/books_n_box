import 'package:flutter/material.dart';
import '../../../dummy.dart';
import '../../widgets/back_icon_button.dart';


class ScreenBar extends StatelessWidget {
  const ScreenBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Color(0x282828),
      expandedHeight: 300,
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          title: Container(
            padding: EdgeInsets.all(15),
            child: Text('Book Name From API',
              textAlign: TextAlign.start,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              fontSize: 18
            ),),
          ),
            background: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  child: Image.network(Dummy.chooseRand(),fit: BoxFit.cover,),
                  ),
                Container(
                width: double.infinity,
                decoration: new BoxDecoration(
                gradient: new LinearGradient(
                  tileMode: TileMode.clamp,
                  begin: const Alignment(0.0, 1),
                end: const Alignment(0.0,0),
                colors: <Color>[
                  const Color(0xFF000000),
                Colors.black12.withOpacity(0.0)
                ],
                ),
                )
                ),
              ],

            )
            ),
      leading: BackIconButton(),
      leadingWidth: 90,
    );;
  }
}