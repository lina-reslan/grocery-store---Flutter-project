

import 'package:flutter/material.dart';
import 'package:myapp/services/utils.dart';
import 'package:myapp/widgets/textWidget.dart';
import 'package:provider/provider.dart';

import '../provider/dark_theme_provider.dart';
import '../widgets/categories_widget.dart';

class CategoriesScreen extends StatelessWidget {
   CategoriesScreen({super.key});
  final List<Map<String,dynamic>> catList = [
    {
      'imagePath': 'assets/images/cart/fruit.png',
      'catText':'Fruit',
      'color': const Color(0xff538175)
    },
    {
      'imagePath': 'assets/images/cart/grains.png',
      'catText':'Grains',
      'color':  const Color(0xffF8A44C)
    },
    {
      'imagePath': 'assets/images/cart/vegetables.png',
      'catText':'Grocery',
      'color': const Color(0xffF7A593)
    },
    {
      'imagePath': 'assets/images/cart/herbs.png',
      'catText':'Herbs',
      'color': const Color(0xffD3B0E0)
    },
    {
      'imagePath': 'assets/images/cart/nuts.jpg',
      'catText':'Nuts',
      'color': const Color(0xffFDE59B)
    },
    {
      'imagePath': 'assets/images/cart/spinach.png',
      'catText':'Spinach',
      'color': const Color(0xffB7DFF5)
    },
  ];

  @override
  Widget build(BuildContext context) {
     final utils = Utils(context);
     final Color color = utils.color;
    return  Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: TextWidget(
          title: 'Categories',
          textSize: 24,
          color: color,
          isTitle:true

        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 240/250,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: List.generate(6, (index) {
            return  CategoriesWidget(
              catText: catList[index]['catText'],
              imagePath: catList[index]['imagePath'],
              colorCat: catList[index]['color'],);
          }),
        ),
      )
    );
  }
}