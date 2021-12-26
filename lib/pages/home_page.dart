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
  loadData() async{
  var catalog_json = await rootBundle.loadString("assets/files/product_catalog.json");  // taking data out from json
  var decodedData = jsonDecode(catalog_json); //decoding json in to normal data
  print(catalog_json);
  }
  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(20, (index) => CatalogModels.Product[0]);   //add dummy data
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Catalog App",
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: dummyList.length ,//CatalogModels.Product.length,
            itemBuilder: (context,index){
            return ItemWidget(
              items: dummyList[index],//CatalogModels.Product[index],
            );
            }),
      ),
      drawer: MyDrawer(),
    );
  }
}
