

import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:myapp/services/utils.dart';
import 'package:myapp/widgets/price_widget.dart';
import 'package:myapp/widgets/textWidget.dart';

import 'heart_btn.dart';


class OnSaleWidget extends StatefulWidget {
  const OnSaleWidget({super.key});

  @override
  State<OnSaleWidget> createState() => _OnSaleWidgetState();
}

class _OnSaleWidgetState extends State<OnSaleWidget> {
  @override
  Widget build(BuildContext context) {
    final utils = Utils(context);
    Size size = utils.getScreenSize;
    final theme = utils.getTheme;
    final color = utils.color;
    return  Material(
      color: Theme.of(context).cardColor.withOpacity(0.9),
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
       borderRadius: BorderRadius.circular(12),
        onTap: (){},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(

              children: [
                Image.asset('assets/images/sale/apricots.png',
                     height: size.height *0.22,
                      width: size.height *0.22,
                       fit: BoxFit.fill,),

                Column(
                  children: [
                    TextWidget(
                        title: '1KG',
                        textSize: 22,
                        color: color,
                        isTitle: true,
                    ),
                    const SizedBox(height: 6,),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: (){
                            print('bag button is pressed');
                          },
                          child: Icon(
                            IconlyLight.bag2,
                            size: 22,
                            color: color,
                          ),
                        ),
                        const HeartButton(),
                      ],
                    ),

                  ],
                ),
              ],
            ),
             const PriceWidget(
               salePrice: 2.99,
               price: 5.9,
               isOnSale: true,
               textPrice: '1',
             ),
            const SizedBox(height: 5,),
            TextWidget(
                title: 'product title',
                textSize: 16,
                color: color,
                 isTitle: true,
            ),


          ],
        ),
      ),
    );
  }
}
