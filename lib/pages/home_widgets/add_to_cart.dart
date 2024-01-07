import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/core/store.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../models/cart.dart';
import '../../models/catalog.dart';

class AddtoCartState extends StatelessWidget {
  final Item catalog;

  AddtoCartState(
      this.catalog,
      );
  //final _cart=CartModel();

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation,RemoveMutation]);
 final CartModel _cart= (VxState.store as MyStore).cart;
 //final CatalogModel _catalog= (VxState.store as MyStore).catalog;

    bool isinCart =_cart.items.contains(catalog) ?? false;

    return ElevatedButton(
      onPressed: () {
       // isinCart = isinCart.toggle();
        if(!isinCart){
          AddMutation(catalog);
          // final _catalog=CatalogModel();


     //     setState(() {});

        }

      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          context.theme.cardColor,
        ),
        shape: MaterialStateProperty.all(
          StadiumBorder(),
        ),
      ),
      child: isinCart ? Icon(Icons.done): Icon(CupertinoIcons.cart_badge_plus),
    );
  }
}
