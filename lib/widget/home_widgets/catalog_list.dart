import 'package:flutter/material.dart';
import 'package:untitled/models/cart.dart';
import 'package:untitled/models/catalog.dart';
import 'package:untitled/pages/home_detail_page.dart';
import 'package:untitled/widget/home_widgets/add_to_cart.dart';
import 'package:untitled/widget/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import 'catalog_image.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: CatalogModels.Product.length,
        itemBuilder: (context, index) {
          final catalog = CatalogModels.Product[index];
          return InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomeDetailPage(catalog: catalog))),
              child: CatalogItem(catalog: catalog));
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
        Hero(
          tag: Key(catalog.Id.toString()),
          child: catalogImage(
            image: catalog.image,
          ),
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog.Name.text.bold.color(context.accentColor).make(),
            catalog.Description.text.make(),
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: Vx.mOnly(right: 4),
              children: [
                "\$${catalog.Price}".text.bold.lg.make(),
                AddToCart(catalog: catalog)
              ],
            )
          ],
        ))
      ],
    )).color(context.cardColor).rounded.square(180).make().py16();
  }
}
