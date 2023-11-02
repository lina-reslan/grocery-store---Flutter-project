
import 'package:flutter/material.dart';
import 'package:myapp/services/utils.dart';
import 'package:myapp/widgets/textWidget.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget({super.key, required this.salePrice, required this.price, required this.isOnSale, required this.textPrice});
  final double salePrice , price;
  final String textPrice;
  final bool isOnSale ;

  @override
  Widget build(BuildContext context) {
    final utils = Utils(context);
    Color color = utils.color;
    final usedPrice = isOnSale ? salePrice : price ;
    return  FittedBox(
      child: Row(
        children: [
          TextWidget(
              title: '\$${(salePrice * int.parse(textPrice)).toString()}',
              textSize: 18,
              color: Colors.green,
          ),
          const SizedBox(width: 5,),
           Visibility(
             visible: isOnSale ? true : false,
             child: Text(
                '\$${(price * int.parse(textPrice)).toString()}',
              style: TextStyle(
                fontSize: 15,
                color: color,
                decoration: TextDecoration.lineThrough,
              ),
          ),
           ),

        ],
      ),
    );
  }
}
