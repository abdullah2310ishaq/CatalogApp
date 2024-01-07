import 'package:flutter/material.dart';
import 'package:myapp/models/cart.dart';
import 'package:velocity_x/velocity_x.dart';

import '../core/store.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.center.color(context.cardColor).make(),
      ),
      body: Column(
        children: [
          _CartList().p32().expand(),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("RE BUILD HAPPENED");
    final CartModel _cart= (VxState.store as MyStore).cart;
   // final _cart=CartModel();
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxConsumer(
            notifications: {},
            mutations: {RemoveMutation},
            builder: (context, data, status) {
              print("RE BUILD HAPPENED");
              return "\$${_cart.totalPrice}"
                  .text.xl5
                  .color(context.theme.colorScheme.secondary)
                  .make();
            },
          ),

          30.widthBox,
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all(context.theme.cardColor)),
            child: "Buy".text.white.make(),
          ).w32(context)
        ],
      ),
    );
  }
}


class _CartList extends StatelessWidget{
  //final _cart=CartModel();
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart= (VxState.store as MyStore).cart;
    return _cart.items.isEmpty
        ? "You are Broke".text.xl2.makeCentered():
    ListView.builder(
      itemCount: _cart.items.length,
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.done),
        trailing: IconButton(
          icon: Icon(Icons.remove_circle_outline),
          onPressed: () {

RemoveMutation(_cart.items[index]);
          },
        ),
        title: _cart.items[index].name.text.make(),
      ),
    );
  }
}