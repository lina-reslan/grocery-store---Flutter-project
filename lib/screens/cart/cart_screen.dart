
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:myapp/widgets/textWidget.dart';

import '../../services/utils.dart';
import 'cart_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final utils = Utils(context);
    Color color = utils.color;
    Size size = utils.getScreenSize;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title: TextWidget(
          title: 'Cart (2)',
          textSize: 22,
          color: color,
          isTitle: true,
        ),
        actions: [
          IconButton(
              onPressed: (){},
              icon: Icon(IconlyBold.delete , color: color,)),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: size.height *0.1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Material(
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.circular(12),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: (){},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextWidget(
                          title: 'Order Now',
                          textSize: 20,
                          color: Colors.white,

                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  FittedBox(
                    child: TextWidget(
                      title: 'Total: \$200',
                      textSize: 20,
                      color: color,
                      isTitle: true,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
                itemBuilder: (context,index){
              return const CartWidget();
            }),
          ),
        ],
      ),
    );
  }
}
