import 'package:driver_app/home_tab.dart';
import 'package:driver_app/profile_tab.dart';
import 'package:driver_app/rating_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'earning_tab.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>with SingleTickerProviderStateMixin {
  TabController? tabController;
  int selectedIndex=0;
  onItemClicked(int index){
    setState(() {
      selectedIndex=index;
      tabController!.index=selectedIndex;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController=TabController(length: 4, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: TabBarView(
      physics: NeverScrollableScrollPhysics(),
      controller: tabController,
      children: [
        HomeTab(),
        ProfileTab(),

      ],
    ),
    bottomNavigationBar: BottomNavigationBar(items: [
      BottomNavigationBarItem(icon:Icon(Icons.home),label: "Home"),
      BottomNavigationBarItem(icon: Icon(Icons.person),label: "Account")
    ],unselectedItemColor: Colors.white54,
    selectedItemColor: Colors.white,
    backgroundColor: Colors.black,
    type: BottomNavigationBarType.fixed,
    selectedLabelStyle: TextStyle(fontSize: 14),
    showSelectedLabels: true,
    currentIndex: selectedIndex,
    onTap: onItemClicked,)
      )
    ;
  }
}
