import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../services/utils.dart';

class HeartButton extends StatelessWidget {
  const HeartButton({super.key});

  @override
  Widget build(BuildContext context) {
    final utils = Utils(context);
    final color = utils.color;
    return GestureDetector(
      onTap: (){
        print('heart button is pressed');
      },
      child:  Icon(
        IconlyLight.heart,
        size: 22,
        color: color,
      ),
    );
  }
}
