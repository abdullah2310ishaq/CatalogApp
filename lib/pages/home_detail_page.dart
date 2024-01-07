import 'package:flutter/material.dart';
import 'package:myapp/pages/home_widgets/add_to_cart.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:myapp/models/catalog.dart';
import '../widgets/themes.dart';

class HomeDetailPage extends StatelessWidget {
   final Item catalog;

  const HomeDetailPage({Key? key, required this.catalog})

      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar:  Container(
        color:context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl4.red800.make(),
            AddtoCartState(catalog).wh(100, 50),
          ],
        ).
        pOnly(right: 8.0).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
                tag:Key(catalog.id.toString()),
                child: Image.network(catalog.image).h32(context)
            ),

            Expanded(child: VxArc(
              height: 30.0,
              arcType: VxArcType.CONVEY,
              edge: VxEdge.TOP,
              child: Container(
                color:context.cardColor,
                width:context.screenWidth ,
                child: Center(
                  child: Column(
                    children: [
                      catalog.name.text.xl4.
                      color(context.accentColor)
                          .bold.make(),
                      catalog.desc.text.xl.
                      textStyle(context.captionStyle)
                          .make(),
                      10.heightBox,
                      " Lorem Ipsum is simply dummy text of the printing and typesetting industry."
                          .text
                          .textStyle(context.captionStyle)
                          .make().p16()
                    ],
                  ).py64(),
                ),
              ),
            )) // Corrected 'Image' to 'image'
          ],
        )
      ),
    );
  }
}
