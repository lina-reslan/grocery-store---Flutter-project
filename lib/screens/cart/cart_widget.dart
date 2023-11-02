
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:myapp/inner_screens/cart_screen.dart';
import 'package:myapp/widgets/textWidget.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import '../../services/utils.dart';
import '../../widgets/heart_btn.dart';
import 'package:myapp/services/global_method.dart';

class CartWidget extends StatefulWidget {
  const CartWidget({super.key});
  static const routName = "/CartWidget";

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
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
    GlobalMethod globalMethod = GlobalMethod();

    return GestureDetector(
      onTap: (){
        Navigator.pushNamed (context, CartScreen.routName );
        // globalMethod.navigateTo(context, CartScreen.routName);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/sale/carrots.png',
                    width: size.width * 0.21,
                    height: size.height * 0.21,
                    fit: BoxFit.fill,
                  ),
                  Column(
                    children: [
                      TextWidget(
                          title: 'title',
                          textSize: 18,
                          color: color,
                          isTitle: true,
                      ),
                      const SizedBox(height: 16,),
                      SizedBox(
                        width: size.width *0.25,
                        child: Row(
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
                      ),
                    ],
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        const InkWell(
                          child: Icon(
                            CupertinoIcons.cart_badge_minus ,
                            color: Colors.red,
                            size: 20,
                          ),
                        ),
                        const HeartButton(),
                        TextWidget(
                            title: '20\$',
                            textSize: 18,
                            color: color),
                      ],
                    ),
                  ),
                  const SizedBox(width: 5,)
                ],
              ),

            ),
          ),
        ],
      ),
    );
  }
}

class QuantityWidget extends StatelessWidget {
  const QuantityWidget({
    super.key, required this.icon, required this.color, required this.fct});
  final IconData icon;
  final Color color;
  final Function fct;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Material(
          color: color,
          borderRadius: BorderRadius.circular(12),
          child:  InkWell(
            onTap: (){fct;},
            borderRadius: BorderRadius.circular(12),
            child:  Padding(
              padding: const EdgeInsets.all(6.0),
              child: Icon(
                icon,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
