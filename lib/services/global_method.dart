
import 'package:flutter/material.dart';

import '../inner_screens/on_sale_screen.dart';

class GlobalMethod{
   navigateTo(BuildContext context, String routName){
    Navigator.pushNamed (context, routName );
  }

}