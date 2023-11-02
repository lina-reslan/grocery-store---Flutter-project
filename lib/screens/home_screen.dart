

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:myapp/inner_screens/on_sale_screen.dart';
import 'package:myapp/provider/dark_theme_provider.dart';
import 'package:myapp/services/global_method.dart';
import 'package:myapp/services/utils.dart';
import 'package:myapp/widgets/textWidget.dart';
import 'package:provider/provider.dart';

import '../inner_screens/feeds_screen.dart';
import '../widgets/feeds_widget.dart';
import '../widgets/on_sale_widget.dart';

class HomeScreen extends StatefulWidget {
   const HomeScreen({super.key});


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> storeList = [
    'assets/images/store/store1.jpg',
    'assets/images/store/store2.jpg',
    'assets/images/store/store3.jpg',
    'assets/images/store/store4.jpg',
  ];
  @override
  Widget build(BuildContext context) {

    final utils = Utils(context);
    final themeState = utils.getTheme ;
    Size size = utils.getScreenSize;
    Color color = utils.color;
    GlobalMethod globalMethod = GlobalMethod();
    return   Scaffold(
      body:SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height*0.33,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return Image.asset(storeList[index],
                    fit: BoxFit.fill,
                  );
                },
                itemCount: storeList.length,
                itemWidth: 400.0,
                layout: SwiperLayout.STACK,
              ),
            ),
            const SizedBox(height: 10,),
            TextButton(
                onPressed: (){
                  // Navigator.pushNamed (context, OnSaleScreen.routName );
                  globalMethod.navigateTo(context, OnSaleScreen.routName);
                },
                child: TextWidget(
                  title: 'View all',
                  textSize: 20,
                  color: Colors.blue,
                  maxLines: 1,
                ),

            ),
            const SizedBox(height: 10,),
            Row(
              children: [
                RotatedBox(
                  quarterTurns: -1,
                  child: Row(
                    children: [
                      TextWidget(
                          title: 'on sale'.toUpperCase(),
                          textSize: 22,
                          isTitle: true,
                          color: Colors.red),
                      const SizedBox(width: 5,),
                      const Icon(
                        IconlyLight.discount,
                        color: Colors.red,),
                    ],
                  ),
                ),
                const SizedBox(width: 8,),
                Flexible(
                  child: SizedBox(

                    height: size.height * 0.3,
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context,index){
                      return const OnSaleWidget();
                    }),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                      title: 'Our Products',
                      textSize: 22,
                      color: color,
                      isTitle: true,

                  ),
                  TextButton(
                      onPressed: (){
                        globalMethod.navigateTo(context, FeedsScreen.routName);
                      },
                      child: TextWidget(
                        title: 'Brows all',
                        textSize: 20,
                        color: Colors.blue,

                      ),),
                ],
              ),
            ),
            const SizedBox(height: 10,),
            GridView.count(
              crossAxisCount: 2,
              // crossAxisSpacing: 8,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: size.width /(size.height * 0.57),
              children:
                List.generate(4, (index) {
                  return const Flexible(
                    flex: 1,
                      child: FeedsWidget());
                })

            ),

          ],
        ),
      )
    );
  }
}
