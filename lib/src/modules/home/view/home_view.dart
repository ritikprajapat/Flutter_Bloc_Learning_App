import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: buildPage(currentIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          currentIndex = value;
          setState(() {});
        },
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(
              Icons.home,
              size: 28,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Search',
            icon: Icon(
              Icons.search,
              size: 28,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Courses',
            icon: Icon(
              Icons.play_arrow,
              size: 28,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Messages',
            icon: Icon(
              Icons.message_rounded,
              size: 28,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(
              Icons.person,
              size: 28,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPage(int index) {
    List pages = [
      Center(
        child: Text('Home'),
      ),
      Center(
        child: Text('Search'),
      ),
      Center(
        child: Text('Profile'),
      ),
      Center(
        child: Text('Settings'),
      ),
      Center(
        child: Text('Settings'),
      ),
    ];
    return pages[index];
  }
}
