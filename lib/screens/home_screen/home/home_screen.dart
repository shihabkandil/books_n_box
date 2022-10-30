import 'package:flutter/material.dart';
import 'package:mobile_app_project/screens/home_screen/widgets/books_tab_view.dart';
import '../../shared/widgets/bottom_bar.dart';
import '../widgets/app_header.dart';
import '../widgets/best_sellers_title.dart';
import '../widgets/home_carousel.dart';
import '../widgets/home_catigories_titles.dart';


class HomeScreen extends StatefulWidget {

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin{


  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4,vsync: this);
  }

  @override
  void dispose(){
    _tabController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AppBottomNavBar(),
      backgroundColor: Theme.of(context).backgroundColor,
        body:SingleChildScrollView(
        child: Column(
          children: [

            AppHeader(),
            HomeCatigoriesTitles(tabcontroller: _tabController),
            BooksTabsView(tabController: _tabController),
            BestSellersTitle(),
            HomeScreenCarousel(),
            
          ],
        )
        ),
    );
  }
}