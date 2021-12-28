import 'package:flutter/material.dart';
import 'package:untitled/models/catalog.dart';
import 'package:untitled/widget/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final item catalog;

  const HomeDetailPage({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: MyTheme.creamColor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: Vx.mOnly(right: 8),
          children: [
            "\$${catalog.Price}".text.bold.xl2.red500.make(),
            ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(MyTheme.drakBluishColor),
                  shape: MaterialStateProperty.all(StadiumBorder()),
                ),
                child: "Add to Cart".text.make())
          ],
        ).p2(),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Hero(
                    tag: Key(catalog.Id.toString()),
                    child: Image.network(catalog.image))
                .h48(context),
            Expanded(
                child: VxArc(
              height: 30.0,
              arcType: VxArcType.CONVEY,
              edge: VxEdge.TOP,
              child: Container(
                color: Colors.white,
                width: context.screenWidth,
                child: Column(
                  children: [
                    catalog.Name.text.xl4.bold
                        .color(MyTheme.drakBluishColor)
                        .make(),
                    catalog.Description.text.make(),
                    10.heightBox,
                  ],
                ).py32(),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
