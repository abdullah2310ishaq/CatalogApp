import 'package:flutter/material.dart';
import 'package:myapp/pages/cart_page.dart';
import 'package:myapp/pages/home_page.dart';
import 'package:myapp/pages/login_page.dart';
import 'package:myapp/utils/routes.dart';
import 'package:myapp/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import 'core/store.dart';

void main(){
  runApp(VxState(store: MyStore() ,child: Abc()));
}

class Abc extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      themeMode:ThemeMode.light,
      theme: MyTheme.lightTheme(context),

initialRoute:MyRoutes.loginRoute,
routes: {
        "/":(context) =>LoginPage(),
       MyRoutes.homeRoute :(context) => HomePage(),
       MyRoutes.loginRoute:(context) => LoginPage(),
       MyRoutes.cartRoute:(context) => CartPage(),


},
    ) ;
  }
}
