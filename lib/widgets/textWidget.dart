
import 'package:flutter/cupertino.dart';

class TextWidget extends StatelessWidget {
   TextWidget({super.key, required this.title, required this.textSize, required this.color,this.isTitle = false
  ,this.maxLines = 10});
  final String title;
  final double textSize;
  final Color color;
  bool isTitle = false;
  int maxLines =10;


  @override
  Widget build(BuildContext context) {
    return  Text(
        title,
        maxLines: maxLines,
        style: TextStyle(
          overflow: TextOverflow.ellipsis,
          color: color,
            fontSize: textSize,
            fontWeight: isTitle ? FontWeight.bold : FontWeight.normal
        ),
    );
  }
}
