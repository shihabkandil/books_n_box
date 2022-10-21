import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';

import 'header_text.dart';
import 'home_top_reviews_grid.dart';


class ApiTabbar extends StatelessWidget {
  const ApiTabbar({super.key});



  @override
  Widget build(BuildContext context) {
    return 
               DefaultTabController(
          length: 3,
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: <Widget>[
                ButtonsTabBar(
                  height: 75,
                  backgroundColor: Color.fromARGB(255, 75, 82, 89).withOpacity(0.5),
                  unselectedBackgroundColor: Color.fromARGB(255, 255, 255, 255),
                  borderWidth: 0,
                  radius: 9,
                  buttonMargin: EdgeInsets.all(4),
                  elevation: 3.5,
                  tabs: [
                      Tab(
                        child: SizedBox(
                          width: 100,
                          height: 35,
                          child: Image.asset('assets/images/Symbol-New-York-Times.png')
                          ),
                      ),
                      Tab(
                        child: SizedBox(
                          width: 100,
                          height: 35,
                          child: Image.asset('assets/images/Marvel-Comics-Logo.svg.png')
                          ),
                      ),
                      Tab(
                        child: SizedBox(
                          width: 100,
                          height: 35,
                          child: Image.asset('assets/images/Google_Books_logo_2015.svg.png')
                          ),
                      ),],
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(padding: EdgeInsets.all(10),child: HeaderText(text: "Top Reviews"))
                  ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),

                    child: TabBarView(
                      children: [
                        HomeTopReviewsGrid(),

                        Container(
                          
                        ),
                        Container(
                          
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
  }
}