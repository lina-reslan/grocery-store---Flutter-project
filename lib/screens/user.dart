

import 'dart:js';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:myapp/services/utils.dart';
import 'package:provider/provider.dart';

import '../provider/dark_theme_provider.dart';
import '../widgets/textWidget.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final TextEditingController addressTextController = TextEditingController(text: "");
  @override
  void dispose() {
    addressTextController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    // final themeState = Provider.of<DarkThemeProvider>(context);
    // final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;
     final utils = Utils(context);
     Color color = utils.color;
    return  Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                RichText(
                  text:  TextSpan(
                  text: 'Hi,  ',
                  style: const TextStyle(
                    color: Colors.cyan,
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                  ),
                    children: <TextSpan> [
                      TextSpan(
                        text: 'My name',
                        style: TextStyle(
                          color: color,
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = (){
                          print('pressed');
                        }
                      ),
                    ],
                ),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextWidget(
                    title: 'Email@email.com',
                    textSize: 18,
                    color: color),
                const SizedBox(
                  height: 20,
                ),
                const Divider(
                  thickness: 2,
                ),
                const SizedBox(
                  height: 20,
                ),
                ListTiles(
                  title: 'Address',
                  subTitle: 'nnn',
                  icon: IconlyLight.profile,
                  onPressed: () async {
                  await showAddressDialog(context);
                  },
                  color: color,
                ),

                ListTiles(
                  title: 'Orders',
                  icon: IconlyLight.bag,
                  onPressed: (){},
                  color: color,
                ),
                ListTiles(
                  title: 'WishList',
                  icon: IconlyLight.heart,
                  onPressed: (){},
                  color: color,
                ),
                ListTiles(
                  title: 'Viewed',
                  icon: IconlyLight.heart,
                  onPressed: (){},
                  color: color,
                ),
                ListTiles(
                  title: 'Forget Password',
                  icon: IconlyLight.unlock,
                  onPressed: (){},
                  color: color,
                ),
                SwitchListTile(
                  title: TextWidget(
                    title: 'Theme',
                    textSize: 22,
                    color: color,
                    isTitle: true,
                  ),
                  secondary: Icon(utils.getTheme ? Icons.light_mode_outlined:Icons.dark_mode_outlined) ,
                  value: utils.getTheme,
                  onChanged: (bool? value){
                    setState(() {
                      utils.getTheme! ;
                    });

                  },

                ),

                ListTiles(
                  title: 'Logout',
                  icon: IconlyLight.logout,
                  onPressed: () async{
                    await showLogoutDialog(context);
                  },
                  color: color,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> showLogoutDialog (BuildContext context)async {
    await showDialog(
      context: context,
      builder: (context){
        return
          AlertDialog(
            title: Row(
              children: [
                Image.asset(
                  'assets/images/warning.png',
                  height: 20,
                  width: 20,
                  fit: BoxFit.fill,
                ),
                const SizedBox(width: 8,),
                const Text('Sign Out'),
              ],
            ),
            content: const Text('Do you want sign out ?'),
            actions: [
              TextButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                child:  TextWidget(
                    title: 'Cancel',
                  textSize: 18,
                  color: Colors.cyan,

                ),),
              TextButton(
                onPressed: (){
                  if(Navigator.canPop(context)){
                    Navigator.pop(context);
                  }

                },
                child: TextWidget(
                  title: 'yes',
                  textSize: 18,
                  color: Colors.red,
                ),),
            ],
          );

      }, );

  }

  Future<void> showAddressDialog (BuildContext context)async {
     await showDialog(
         context: context,
         builder: (context){
      return
        AlertDialog(
          title: const Text('Update'),
          content: TextField(
            onChanged: (value){
              print('addressTextController.text${addressTextController.text}');

            },
            controller: addressTextController,
            maxLines: 5,
            decoration: const InputDecoration(
                hintText: "Your Address"
            ) ,
          ),
          actions: [
            TextButton(
              onPressed: (){},
              child: const Text('Update'),),
          ],
        );

    }, );

  }
}



class ListTiles extends StatelessWidget {
   const ListTiles({
    super.key,
     required this.title, required this.icon, this.subTitle, required this.onPressed, required this.color

  });
  final String title;
   final String? subTitle;
   final IconData icon;
   final Function onPressed;
   final Color color;


  @override
  Widget build(BuildContext context) {
    return  ListTile(
      title: TextWidget(
        title: title,
        color: color ,
        textSize: 22 ,
        isTitle: true,

      ),
      subtitle: TextWidget(
        title: subTitle ?? "",
        color: color,
        textSize:18 ,
      ),
      leading: Icon(icon),
      trailing: const Icon(IconlyLight.arrowRight2),
      onTap: (){
        onPressed();
    },
    );

    // return Row(
    //   children: [
    //     const Icon(Icons.settings),
    //     const SizedBox(width: 18),
    //     Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: const [
    //         Text('title'),
    //         Text('subtitle'),
    //       ],
    //     ),
    //     const Spacer(),
    //     const Icon(Icons.chevron_right),
    //   ],
    // );
  }
}
