import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/models/catalog.dart';
import 'package:untitled/widget/drawer.dart';
import 'package:untitled/widget/item_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(20, (index) => CatalogModels.Product[0]);
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
