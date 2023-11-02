

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:myapp/widgets/feeds_widget.dart';

import '../services/global_method.dart';
import '../services/utils.dart';
import '../widgets/on_sale_widget.dart';
import '../widgets/textWidget.dart';

class FeedsScreen extends StatefulWidget {
  const FeedsScreen({super.key});
  static const routName = "/FeedsScreen";

  @override
  State<FeedsScreen> createState() => _FeedsScreenState();
}

class _FeedsScreenState extends State<FeedsScreen> {
    final TextEditingController searchTextController = TextEditingController();
    final FocusNode searchTextFocusNode = FocusNode();
    @override
  void dispose() {
      searchTextController.dispose();
      searchTextFocusNode.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final utils = Utils(context);
    final themeState = utils.getTheme ;
    Size size = utils.getScreenSize;
    Color color = utils.color;
    GlobalMethod globalMethod = GlobalMethod();
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
          title: 'All Products',
          textSize: 24,
          color: color,
          isTitle: true,
        ),

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: SizedBox(
                 height: kBottomNavigationBarHeight,
                 child: TextField(
                   focusNode:searchTextFocusNode ,
                  controller: searchTextController,
                   decoration:  InputDecoration(
                     focusedBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(12),
                       borderSide: const BorderSide(color: Colors.greenAccent,width: 1)
                     ),
                     enabledBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(12),
                         borderSide: const BorderSide(color: Colors.greenAccent,width: 1)
                     ),
                     hintText: "search",
                     prefixIcon: const Icon(Icons.search),
                     suffix: IconButton(
                       onPressed: (){
                         searchTextController!.clear();
                         searchTextFocusNode.unfocus();
                       },
                       icon:  Icon(
                         Icons.close,
                         color: searchTextFocusNode.hasFocus ?  Colors.red : color,),
                     ),

                   ),
            ),
               ),
             ),
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
                List.generate(10, (index) {
                  return const FeedsWidget();
                })

            ),
          ],
        ),
      ),

    );
  }
}
