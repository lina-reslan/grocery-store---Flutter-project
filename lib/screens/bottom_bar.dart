

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import 'package:myapp/screens/categories.dart';
import 'package:myapp/screens/home_screen.dart';
import 'package:myapp/screens/user.dart';
import 'package:provider/provider.dart';

import '../provider/dark_theme_provider.dart';
import 'cart/cart_screen.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int _selectedIndex = 0;
  final List<Map<String,dynamic>> _pages=[
    {'page': const HomeScreen(), 'title': ' Home Screen'},
    {'page': CategoriesScreen(), 'title':' Category Screen'},
    {'page': const CartScreen(), 'title':' Cart Screen'},
    {'page': const UserScreen(), 'title':'User Screen'},

  ];
  void _selectedPage(int index){
    setState(() {
      _selectedIndex = index;
    });
    
  }
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    bool isDark = themeState.getDarkTheme;
    return  Scaffold(
      // appBar: AppBar(
      //   title:  Text(_pages[_selectedIndex]['title']),
      // ),
      body: _pages[_selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: isDark ? Theme.of(context).cardColor :Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        unselectedItemColor: isDark? Colors.white10 : Colors.black12,
        selectedItemColor: isDark? Colors.lightBlue.shade200 : Colors.black87,
        onTap: _selectedPage,
        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(_selectedIndex == 0 ?IconlyBold.home:IconlyLight.home),
              label: "home"),
          BottomNavigationBarItem(
              icon: Icon(_selectedIndex == 1 ?IconlyBold.category:IconlyLight.category),
              label: "categories"),
          BottomNavigationBarItem(
              icon: Icon(_selectedIndex == 2 ?IconlyBold.buy:IconlyLight.buy),
              label: "cart"),
          BottomNavigationBarItem(
              icon: Icon(_selectedIndex == 3 ?IconlyBold.user2:IconlyLight.user2),
              label: "user")

        ],
      ),
      );

  }
}
