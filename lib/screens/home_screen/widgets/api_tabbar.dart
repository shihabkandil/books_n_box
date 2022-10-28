import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app_project/utils/grid_bg.dart';
import 'package:mobile_app_project/utils/screen_block_size.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'header_text.dart';
import 'home_top_reviews_grid.dart';

class ApiTabBar extends StatelessWidget {
  const ApiTabBar({super.key});



  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        final ScreenBlockSize _screenBlockSize = ScreenBlockSize(screenSizeConfig: sizingInformation);
        return DefaultTabController(
          length: 3,
          child: SizedBox(
            height: _screenBlockSize.verticalBlockSize * 100,
            child: Column(
                    children: <Widget>[
                      ButtonsTabBar(
                        backgroundColor: Colors.white,
                        height: 65,
                        borderWidth: 2,
                        unselectedBorderColor: Colors.white,
                        unselectedBackgroundColor: Colors.white,
                        radius: _screenBlockSize.horizontalBlockSize * 5,
                        buttonMargin: EdgeInsets.all(4),
                        elevation: 2,
                        splashColor: Colors.white,
                        tabs: [
                          Tab(
                            icon: SizedBox(
                                width: 100,
                                height: 35,
                                child: Image.asset('assets/images/Symbol-New-York-Times.png',)
                            ),
                          ),
                          Tab(
                            icon: SizedBox(
                                width: 100,
                                height: 35,
                                child: Image.asset('assets/images/Marvel-Comics-Logo.svg.png')
                            ),
                          ),
                          Tab(
                            icon: SizedBox(
                                width: 100,
                                height: 35,
                                child: Image.asset('assets/images/Google_Books_logo_2015.svg.png')
                            ),
                          ),],
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Container(child: HeaderText(text: "Top Reviews"))
                      ),
                      Expanded(
                          child: TabBarView(
                            children: [
                              Container(
                                  color:Colors.white.withOpacity(0.95),
                                  child: HomeTopReviewsGrid(screenBlockSize: _screenBlockSize,),
                              ),
                              Container(
                              ),
                              Container(
                              ),
                            ],
                          )
                      ),
                    ],
                  ),
          ),
        );
      }
    );
  }
}