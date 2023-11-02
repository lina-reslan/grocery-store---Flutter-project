

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:myapp/widgets/heart_btn.dart';

import '../screens/cart/cart_widget.dart';
import '../services/utils.dart';
import '../widgets/textWidget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});
  static const routName = "/CartWidget";

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final TextEditingController quantityTextController = TextEditingController();
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
    final themeState = utils.getTheme ;
    Size size = utils.getScreenSize;
    Color color = utils.color;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(IconlyLight.arrowLeft2, color: color,),
        ),
      ),
      body: SizedBox(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Flexible(
                flex: 2,
                child: Image.asset(
                  'assets/images/sale/carrots.png',
                  width: size.width *0.75,
                  height: size.height *0.75,
                ),
              ),
              Flexible(
                flex: 2,
                child: Column(
                  children: [
                    Row(
                      children: [
                        TextWidget(
                            title: 'Carrots',
                            textSize: 22,
                            color: color

                        ),
                        const Spacer(),
                        const HeartButton(),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      children: [
                        TextWidget(
                          title: '0.99\$',
                          textSize: 22,
                          color: Colors.greenAccent,
                          isTitle: true,
                        ),
                        const Spacer(),
                        Material(
                          color: Colors.greenAccent,
                          borderRadius: BorderRadius.circular(12),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(12),
                            onTap: (){},
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextWidget(
                                title: 'Free delivery',
                                textSize: 20,
                                color: Colors.white,

                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                        QuantityWidget(
                          icon: CupertinoIcons.minus,
                          color: Colors.red,
                          fct: (){
                            print('minus');
                          },
                        ),
                        Flexible(
                          flex: 1,
                          child: TextField(
                            controller: quantityTextController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(focusedBorder: UnderlineInputBorder(borderSide: BorderSide())),
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                            ],
                          ),
                        ),
                        QuantityWidget(
                          icon: CupertinoIcons.add,
                          color: Colors.green,
                          fct: (){
                            print('add');
                          },
                        ),


                      ],
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      children: [
                        FittedBox(
                          child: TextWidget(
                            title: 'Total: \$200  / 1kg',
                            textSize: 20,
                            color: color,
                            isTitle: true,
                          ),
                        ),
                        const Spacer(),
                        Material(
                          color: Colors.greenAccent,
                          borderRadius: BorderRadius.circular(12),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(12),
                            onTap: (){},
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextWidget(
                                title: 'In Cart',
                                textSize: 20,
                                color: Colors.white,

                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ],
                ),
              ),


            ],
          ),
        ),
      ),

    );
  }
}
