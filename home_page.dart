import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/widgets/item_widget.dart';
import 'package:flutter_application_1/widget/drawer.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final String name = "CodePur";

  var Item;

  @override
  void initState() {
    super.initState();
    lodeData();
  }

  loadData() async {
    final catalogjson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodeData = jsonDecode(catalogjson);
    var productsData = decodeData["products"];
    CatalogModel.Items = List.from(productsData).map<item>((item) => Item.fromMap(item))
    .toList();
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: CatalogModel.Items.length,
          itemBuilder: (context, index) {
            return ItemWidget(
              item: CatalogModel.Items[index],
            );
          },
        ),
      ),
      drawer: Drawer(),
    );
  }

  void lodeData() {}
}

class CatalogModel {
  static var Item;

  static var Items;
}
