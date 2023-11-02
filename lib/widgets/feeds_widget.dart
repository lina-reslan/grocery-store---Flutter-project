import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:myapp/widgets/heart_btn.dart';
import 'package:myapp/widgets/price_widget.dart';
import 'package:myapp/widgets/textWidget.dart';

import '../services/utils.dart';

class FeedsWidget extends StatefulWidget {
  const FeedsWidget({super.key});

  @override
  State<FeedsWidget> createState() => _FeedsWidgetState();
}

class _FeedsWidgetState extends State<FeedsWidget> {
   final quantityTextController = TextEditingController();

  @override
  void initState() {
    quantityTextController.text = '1';
    super.initState();
  }
  @override
  void dispose() {
    quantityTextController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final utils = Utils(context);
    Size size = utils.getScreenSize;
    final color = utils.color;
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Material(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: (){},
          borderRadius: BorderRadius.circular(12),
          child: Column(
            children: [
              Image.asset('assets/images/cart/fruit.png',
                height: size.height *0.10,
                width: size.height *0.10,
                fit: BoxFit.fill,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                        title: 'title',
                        textSize: 20,
                        color: color),
                    const HeartButton(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children:  [
                     Flexible(
                       flex:4,
                       child: PriceWidget(
                        salePrice: 2.99,
                        price: 5.9,
                        isOnSale: true,
                        textPrice: quantityTextController.text,
                    ),
                     ),
                    const SizedBox(width: 8,),
                    Flexible(
                      child: Row(
                        children: [
                          FittedBox(
                            child: TextWidget(
                                title: 'kg',
                                textSize: 18,
                                color: color),
                          ),
                          Flexible(
                            flex:2,
                            child: TextFormField(
                            controller: quantityTextController ,
                            style: TextStyle(color: color,),
                            keyboardType: TextInputType.number,
                            key: const ValueKey('10'),
                            enabled: true,
                            maxLines: 1,
                            inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9.]'))],
                            onChanged: (value){
                              setState(() {

                              });
                            },
                          ),),
                        ],
                      ),
                    ),


                  ],
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: (){
                    print('add to cart pressed');
                  },
                  style:  ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Theme.of(context).cardColor),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(12.0),bottomRight: Radius.circular(12.0)))),
                  ),
                  child: TextWidget(
                    title: 'Add To Cart',
                    textSize: 18,
                    color: color,

                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

