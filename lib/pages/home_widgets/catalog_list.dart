import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/models/cart.dart';
import 'package:myapp/pages/home_detail_page.dart';
import 'package:myapp/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../models/catalog.dart';
import 'catalog_image.dart';
import 'add_to_cart.dart';

class CatalogList extends StatefulWidget {
  @override
  _CatalogListState createState() => _CatalogListState();
}

class _CatalogListState extends State<CatalogList> {
  late CatalogModel _catalog = CatalogModel();

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["items"];

    setState(() {
      _catalog.items = List.from(productsData)
          .map<Item>((item) => Item.fromMap(item))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: _catalog.items.length,
      itemBuilder: (context, index) {
        final catalog = _catalog.items[index];
        return InkWell(
            onTap: ()=>Navigator.push
              (context,
                MaterialPageRoute
                  (builder: (context)=>HomeDetailPage(
                    catalog: catalog
                ),
                ),
            ),
            child: CatalogItem(catalog: catalog));
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  CatalogItem({
    required this.catalog,
  });

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
            tag:Key(catalog.id.toString()),
            child: CatalogImage(
              image: catalog.image,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                catalog.name.text.lg.color(context.accentColor).bold.make(),
                catalog.desc.text.textStyle(context.captionStyle).make(),
                10.heightBox,
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: EdgeInsets.zero,
                  children: [
                    "\$${catalog.price}".text.bold.xl.make(),
               AddtoCartState(catalog)                  ],
                ).pOnly(right: 8.0)
              ],
            ),
          )
        ],
      ),
    ).color(context.cardColor).rounded.square(150).make().py16();
  }
}
class AddtoCartState extends StatefulWidget {
   final Item catalog;

  const AddtoCartState(
      this.catalog,
      );



  @override
  State<AddtoCartState> createState() => AddtoCartStateState();
}

class AddtoCartStateState extends State<AddtoCartState> {
  final _cart=CartModel();

  @override
  Widget build(BuildContext context) {
    bool isinCart =_cart.items.contains(widget.catalog) ?? false;

    return ElevatedButton(
      onPressed: () {

        isinCart = isinCart.toggle();
        if(!isinCart){

          final _catalog=CatalogModel();

          _cart.catalog=_catalog;
          _cart.add(widget.catalog);

          setState(() {

          });


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
      child: isinCart? Icon(Icons.done): Icon(CupertinoIcons.cart_badge_plus),
    );
  }
}

