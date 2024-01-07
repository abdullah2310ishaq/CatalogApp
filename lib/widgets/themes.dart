import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';


class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      fontFamily: 'YourFontFamily',
      cardColor: Colors.grey,
      canvasColor: creamColor,
     appBarTheme: AppBarTheme(
        color: Colors.black,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black), toolbarTextStyle: Theme.of(context).textTheme
        .copyWith(
          headline6:
          context.textTheme.headline6?.copyWith(color: Colors.black),
        ).bodyText2, titleTextStyle: Theme.of(context).textTheme
        .copyWith(
          headline6:
          context.textTheme.headline6?.copyWith(color: Colors.black),
        ).headline6,

      ), colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple).copyWith(secondary: Colors.black));

  static ThemeData darkTheme(BuildContext context) => ThemeData(
    brightness: Brightness.dark,
      fontFamily: 'YourFontFamily',
      cardColor: Colors.black,
      canvasColor: darkcreamColor,

      appBarTheme: AppBarTheme(
        color: Colors.black,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.white), toolbarTextStyle: Theme.of(context).textTheme
            .copyWith(
          headline6:
          context.textTheme.headline6?.copyWith(color: Colors.white),
        ).bodyText2, titleTextStyle: Theme.of(context).textTheme
            .copyWith(
          headline6:
          context.textTheme.headline6?.copyWith(color: Colors.white),
        ).headline6,
      ), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white)
  );

  //Colors
  static Color creamColor = Color(0xfff5f5f5);
  static Color darkcreamColor = Vx.gray900;
  static Color darkBluishColor = Color(0xff403b58);
  static Color lightBluishColor = Vx.indigo500;
}