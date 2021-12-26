import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/models/catalog.dart';
import 'package:untitled/widget/drawer.dart';
import 'package:untitled/widget/item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2)); //dummy delays for loader
    final catalog_json = await rootBundle.loadString(
        "assets/files/product_catalog.json"); // taking data out from json
    final decodedData =
        jsonDecode(catalog_json); //decoding json in to normal data
    var productsData = decodedData["products"];
    CatalogModels.Product = List.from(productsData)
        .map<item>((Item) => item.fromMap(Item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    //final dummyList = List.generate(20, (index) => CatalogModels.Product[0]);   //add dummy data
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Catalog App",
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child:
            (CatalogModels.Product != null && CatalogModels.Product.isNotEmpty)
                ? ListView.builder(
                    itemCount: CatalogModels.Product.length,
                    //CatalogModels.Product.length,
                    itemBuilder: (context, index) {
                      return ItemWidget(
                        items: CatalogModels.Product[index],
                      );
                    })
                : Center(
                    child: CircularProgressIndicator(), // loader
                  ),
      ),
      drawer: MyDrawer(),
    );
  }
}
