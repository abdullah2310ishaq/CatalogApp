import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:myapp/models/catalog.dart';
import 'package:myapp/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'home_widgets/catalog_header.dart';
import 'home_widgets/catalog_list.dart';

late CatalogModel _catalog = CatalogModel();


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;
  final String name = "Codepur";
 // Declare _catalog as an instance variable

  @override
  void initState() {
    super.initState(); // Initialize the catalog
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
    return Scaffold(

      backgroundColor: context.canvasColor,
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>Navigator.pushNamed(context,MyRoutes.cartRoute)

        ,backgroundColor: context.theme.cardColor,
      child: Icon(CupertinoIcons.cart,color: Colors.white,),),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if (_catalog.items.isNotEmpty)
                CatalogList().py16().expand()
              else
                   CircularProgressIndicator().centered().expand(),

            ],
          ),
        ),
      ),
    );
  }
}

