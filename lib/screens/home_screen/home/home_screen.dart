import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../shared/widgets/app_bottom_navigator.dart';
import '../widgets/api_tabbar.dart';
import '../widgets/header_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String dumy = "fdfds sudif sdf sdoif sdoif sdfodhsoydgfdpf dsf dhsufsdifhdsifh sduifh sdufh sdfsdh fisudhfsdfweiofjdsk h hfsduf odisf hsdh f;dsif sdoi fsdfusdhf;sdoifew we io hfiodh;sdo hfsd fshdiofwehw ;eoifhsdfh sdohf sdoi sdfsdhfsd hisdfods hjsdoi h";

    return SafeArea(
      top: false,
      child: ResponsiveBuilder(
        builder: (context,sizingConfig)=> Scaffold(
        extendBody: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Image.asset(
            'assets/Logo_Blue.png',height: 60,
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          actions: [
            const IconButton(
              onPressed: null,
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
            ),
          ],
        ),
        drawer: Drawer(),
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderText(text: "Choose Source"),
              ApiTabBar(),
            ],
          ),
        ),
          bottomNavigationBar: const AppBottomNavigator(),
    ),
      )
    );
  }
}
