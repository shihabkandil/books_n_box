// import 'package:buttons_tabbar/buttons_tabbar.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:mobile_app_project/utils/constants/app_colors.dart';
// import 'package:mobile_app_project/utils/grid_bg.dart';

// import 'header_text.dart';
// import 'home_top_reviews_grid.dart';

// class TabbarV2 extends StatelessWidget {
//   final double var_height;
//   const TabbarV2({this.var_height = 600, super.key});

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 3,
//       child: SizedBox(
//         height: MediaQuery.of(context).size.height,
//         child: Stack(
//           children: [
//             Container(
//                 alignment: Alignment.center,
//                 child: GridBackGround(var_height: this.var_height)),
//             Column(
//               children: <Widget>[
//                 ButtonsTabBar(
//                   height: 40,
//                   backgroundColor: AppColors.primaryColor,
//                   unselectedBackgroundColor: Color.fromARGB(255, 255, 255, 255),
//                   borderWidth: 0,
//                   radius: 13,
//                   buttonMargin: EdgeInsets.all(4),
//                   elevation: 3.5,
//                   tabs: [
//                     Tab(
//                       child: SizedBox(
//                         width: 100,
//                         height: 35,
//                         child: Center(
//                           child: Text(
//                             "Bookmars",
//                             style: GoogleFonts.rubik(
//                                 color: Colors.black,
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.w500),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Tab(
//                       child: SizedBox(
//                         width: 100,
//                         height: 35,
//                         child: Center(
//                           child: Text(
//                             "Favourites",
//                             style: GoogleFonts.rubik(
//                                 color: Colors.black,
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.w500),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Tab(
//                       child: SizedBox(
//                         width: 100,
//                         height: 35,
//                         child: Center(
//                           child: Text(
//                             "TBR",
//                             style: GoogleFonts.rubik(
//                                 color: Colors.black,
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.w500),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Expanded(
//                   child: Container(
//                     margin: EdgeInsets.symmetric(horizontal: 10),
//                     child: TabBarView(
//                       children: [
//                         HomeTopReviewsGrid(),
//                         HomeTopReviewsGrid(),
//                         HomeTopReviewsGrid(),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
