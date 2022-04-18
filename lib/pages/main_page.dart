import 'package:flutter/material.dart';
import 'package:go_router_sample/pages/first_page.dart';
import 'package:go_router_sample/pages/second_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({
    Key? key,
  }) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _pageViewController = PageController();
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageViewController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          FirstPage(),
          SecondPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'タブ1',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'タブ2',
            tooltip: '',
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          _pageViewController.jumpToPage(index);
        },
      ),
    );
  }
}
