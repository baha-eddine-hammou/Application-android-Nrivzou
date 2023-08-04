import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nrivzou/core/create.dart';
import 'package:nrivzou/core/library.dart';
import 'package:nrivzou/core/notification.dart';
import 'package:nrivzou/core/search.dart';

import 'core/home.dart';

class MainScreenPage extends StatefulWidget {
  const MainScreenPage({super.key});

  @override
  State<MainScreenPage> createState() => _MainScreenPageState();
}

class _MainScreenPageState extends State<MainScreenPage> {
  late PageController
      _pageController; // ya3tina lha9 nbadlou min page l page w y9oul ene hi libre w enehi illi le
  int _page = 0;

  @override
  void initState() {
    _pageController = PageController(
        initialPage:
            0); // n forci l page loula  bich na3mlou tab mta3 des pages
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  navigationTapped(int page) {
    _pageController.jumpToPage(page);
  } // used when user taps bottom nav bar and doesn't scroll

  onPageChanged(int pageParam) {
    setState(() {
      _page = pageParam;
    });
  } // when user scrolls

//List<String> arr=['Home','Notifications','Search','Library']

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(), ta3tik app bar par defautkt w dima3id mawjouda
      // body: SafeArea(child: HomePage()), // we hard-coded
      body: PageView(
        physics: const ScrollPhysics(),
        controller: _pageController,
        onPageChanged:
            onPageChanged, //nrmlmnt yist7a9ou parametre amma houma 1st class donc ye5ouhom automatiquement
        children: <Widget>[
          HomePage(),
          SearchPage(),
          CreatePage(),
          LibraryPage(),
          NotificationPage()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.teal.shade200,
          selectedItemColor: Colors.teal.shade800,
          unselectedItemColor: Colors.grey.shade200,
          onTap: navigationTapped,
          currentIndex: _page,
          items: const [
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: ''),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.search), label: ''),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.pen), label: ''),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.book_fill), label: ''),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.bell), label: ''),
          ]),
    );
  }
}
