

import 'package:flutter/material.dart';
import 'package:myapp/services/utils.dart';
import 'package:myapp/widgets/textWidget.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key, required this.catText, required this.imagePath, required this.colorCat});
  final String catText, imagePath;
  final Color colorCat;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screenWidth = size.width;
    final utils = Utils(context);
    Color color =  utils.color;

    return InkWell(
      onTap: (){
        print('category pressed');
      },
      child: Container(
        decoration: BoxDecoration(
          color: colorCat.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: colorCat.withOpacity(0.7),
            width: 2
          ),
        ),
        child: Column(
          children: [
            Container(
              height: screenWidth* 0.3,
              width: screenWidth* 0.3,
              decoration:  BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePath),
                ),
              ),

            ),
            TextWidget(
                title: catText,
                textSize: 20,
                color: color,
            isTitle: true,),
          ],
        ),
      ),
    );
  }
}
