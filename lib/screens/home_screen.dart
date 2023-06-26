import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:graduationupdate/colors/app_colors.dart';
import 'package:lottie/lottie.dart';

import 'control/control.dart';
import 'data_sheet/data_sheet.dart';
import 'nave_bar/bar_chart_sample1.dart';
import 'result/pie_chart_sample1.dart';
import 'nave_bar/home_nav_bar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  int _tabIndex = 1;
  int get tabIndex => _tabIndex;
  set tabIndex(int v) {
    _tabIndex = v;
    setState(() {});
  }

  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: _tabIndex);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Scaffold(
        backgroundColor: AppColors.pageBackground,
        extendBody: true,
        bottomNavigationBar: CircleNavBar(
          activeIcons: const [
            Icon(Icons.file_copy, color: Colors.deepPurple),
            Icon(Icons.home, color: Colors.deepPurple),
            Icon(Icons.control_camera_sharp, color: Colors.deepPurple),
            Icon(Icons.book, color: Colors.deepPurple),
          ],
          inactiveIcons: const [
            Text("Result",style: TextStyle(color: Colors.white),),
            Text("Home",style: TextStyle(color: Colors.white),),
            Text("Control",style: TextStyle(color: Colors.white),),
            Text("DataSheet",style: TextStyle(color: Colors.white),),

          ],
          color: AppColors.menuBackground,
          height: 60,
          circleWidth: 60,
          activeIndex: tabIndex,
          onTap: (index) {
            tabIndex = index;
            pageController.jumpToPage(tabIndex);
          },
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
          cornerRadius: const BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
            bottomRight: Radius.circular(24),
            bottomLeft: Radius.circular(24),
          ),
          shadowColor: Colors.deepPurple,
          elevation: 10,
        ),
        body: PageView(
          controller: pageController,
          onPageChanged: (v) {
            tabIndex = v;
          },
          children: [
            ListView(
              children: [
                PieChartSample1(),
                BarChartSample1()
              ],
            ),
            Home(),
            JoystickExample(),
            DataSheet(),

          ],
        ),
      ),
    );
  }
}