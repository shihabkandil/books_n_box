import 'package:flutter/material.dart';
import '../shared/widgets/app_bottom_navigator.dart';
import 'widgets/back_icon_button.dart';
import 'widgets/introduction_text.dart';

class BookDetailsScreen extends StatelessWidget {
  const BookDetailsScreen({Key? key}) : super(key: key);

  Widget ScreenBar(){
    return SliverAppBar(
      expandedHeight: 500,
      flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          title: Container(
            child: Text('Book Title',
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 18
              ),),
          ),
          background: Stack(
            fit: StackFit.expand,
            children: [
              Container(
                child:  Image.asset('assets/images/All_The_Light.jpg',fit: BoxFit.fitWidth,),
              ),
              Container(
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
          ),
      ),
      leading: BackIconButton(),
    );
  }
  Widget OverviewHeader(){
    return Container(
      margin: EdgeInsets.only(top: 35,bottom: 15,left: 30),
      alignment: Alignment.centerLeft,
      child: Text("Introduction",
        style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 23,
            color: Colors.white
        ),),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: Colors.black,
          body:CustomScrollView(
            slivers: [
              ScreenBar(),
              SliverList(
                delegate: SliverChildListDelegate(
                    [
                    OverviewHeader(),
                    IntroductionText(introductionText: ''),
                  ]
              ),
              ),
            ],
          ),
      bottomNavigationBar: AppBottomNavigator(),
    );
  }
}