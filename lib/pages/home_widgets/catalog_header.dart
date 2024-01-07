import 'package:flutter/material.dart';
import 'package:myapp/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';



class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.center,
          child: "Catalog App".text.xl5.amber800.color(context.theme.colorScheme.secondary).make(),
        ),
        Align(
          alignment: Alignment.center,
          child: "Trending products".text.xl2.make(),
        ),
      ],
    );
  }
}