
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:myapp/widgets/on_sale_widget.dart';
import 'package:myapp/widgets/textWidget.dart';
import '../services/utils.dart';

class OnSaleScreen extends StatelessWidget {
  const OnSaleScreen({super.key});
  static const routName = "/OnSaleScreen";
  @override
  Widget build(BuildContext context) {
    bool isEmpty = true;
    final utils = Utils(context);
    final themeState = utils.getTheme ;
    Size size = utils.getScreenSize;
    Color color = utils.color;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          borderRadius: BorderRadius.circular(12),
          child:Icon(IconlyLight.arrowLeft2 , color: color,) ,
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: TextWidget(
          title: 'Products on Sale',
          textSize: 24,
          color: color,
          isTitle: true,
        ),

      ),
      body: isEmpty ?  Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset('assets/images/sale/impty.png'),
                ),
                const Text(
                  'No Products On Sale Yet \n  Stay tuned',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600),
                ),
              ]

            ),
          ),
      ) : 
      GridView(
          // crossAxisCount: 2,
          // childAspectRatio: size.width /(size.height * 0.4),
          gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            mainAxisExtent: 300, // ** add this **
          ),
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          children:
          List.generate(6, (index) {
            return const OnSaleWidget();
          })

      ),
    );
  }
}
