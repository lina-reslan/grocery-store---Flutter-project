import 'package:flutter/material.dart';
import 'package:myapp/consts/theme_data.dart';
import 'package:myapp/inner_screens/on_sale_screen.dart';
import 'package:myapp/provider/dark_theme_provider.dart';
import 'package:myapp/screens/bottom_bar.dart';
import 'package:provider/provider.dart';

import 'inner_screens/cart_screen.dart';
import 'inner_screens/feeds_screen.dart';

void main() {
  runApp( const MyApp());
}

class MyApp extends StatefulWidget {
   const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async{
    themeChangeProvider.setDarkTheme = await themeChangeProvider.darkThemePrefs.getTheme();

  }

  @override
  void initState(){
    getCurrentAppTheme();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers:[
        ChangeNotifierProvider(create: (_){
          return themeChangeProvider;
        })
      ],
      child: Consumer<DarkThemeProvider>(
        builder: (context, themeProvider, child) {


          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: Styles.themeData(themeProvider.getDarkTheme, context),
            home: const BottomBarScreen(),
            routes: {
              OnSaleScreen.routName : (ctx) => const OnSaleScreen(),
              FeedsScreen.routName : (ctx) => const FeedsScreen(),
              CartScreen.routName : (ctx) => const CartScreen(),
            },
          );
        }
      ),
    );
  }
}




