import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/models/catalog.dart';
import 'package:untitled/widget/drawer.dart';
import 'package:untitled/widget/item_widget.dart';
import 'package:untitled/widget/themes.dart';
import 'package:velocity_x/velocity_x.dart';

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
        backgroundColor: MyTheme.creamColor,
        body: SafeArea(
          child: Container(
              padding: Vx.m32,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CatalogHeader(),
                    if (CatalogModels.Product != null &&
                        CatalogModels.Product.isNotEmpty)
                      CatalogList().expand()
                    else
                      Center(
                        child: CircularProgressIndicator(),
                      )
                  ])),
        ));
  }
}

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      "Catalog App".text.xl5.bold.color(MyTheme.drakBluishColor).make(),
      "Trending Products".text.xl.make(),
    ]);
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: CatalogModels.Product.length,
        itemBuilder: (context, index) {
          final catalog = CatalogModels.Product[index];
          return CatalogItem(catalog: catalog);
        });
  }
}

class CatalogItem extends StatelessWidget {
  final item catalog;

  const CatalogItem({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        catalogImage(
          image: catalog.image,
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog.Name.text.xl.bold.color(MyTheme.drakBluishColor).make(),
            catalog.Description.text.make(),
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: Vx.mOnly(right: 8),
              children: [
                "\$${catalog.Price}".text.bold.lg.make(),
                ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(MyTheme.drakBluishColor),
                      shape: MaterialStateProperty.all(StadiumBorder()),
                    ),
                    child: "Buy".text.make())
              ],
            )
          ],
        ))
      ],
    )).white.rounded.square(150).make().py16();
  }
}

class catalogImage extends StatelessWidget {
  final String image;

  const catalogImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .rounded
        .p8
        .color(MyTheme.creamColor)
        .make()
        .p16()
        .w40(context);
  }
}
