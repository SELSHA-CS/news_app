import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';
import 'package:news_app/constants/colors.dart';
import 'package:news_app/controller/barController.dart';
import 'package:motion_tab_bar/MotionTabBar.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {

    MotionTabBarController? _motionTabBarController;

    var barCntrl = Provider.of<BarController>(context);
    return Scaffold(
      body: barCntrl.pages[barCntrl.index],
      bottomNavigationBar: MotionTabBar( 
        controller: _motionTabBarController,
        tabBarColor: scColor,
        tabSelectedColor: prColor,
        tabIconColor: prColor,
        tabIconSelectedColor: scColor,
        textStyle: TextStyle(color: bgColor),
        onTabItemSelected: (tapIndex) => barCntrl.changePage(tapIndex),
        initialSelectedTab: "Home",
        labels: ["Home", "Category", "Search"],
        icons: [Icons.house, Icons.category, Icons.search],
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   backgroundColor: scColor,
      //   currentIndex: barCntrl.index,
      //   selectedItemColor: prColor,
      //   unselectedItemColor: bgColor,
      //   showUnselectedLabels: false,
      //   onTap: (tapIndex) => barCntrl.changePage(tapIndex),
      //   items: [
      //     BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.house), label: 'Home'),
      //     BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Category'),
      //     BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.magnifyingGlass), label: 'Search')
      //   ]
      // ),
    );
  }
}
