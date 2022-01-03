
import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';
import 'package:untitled/models/cart.dart';
import 'package:untitled/models/catalog.dart';

class AddToCart extends StatefulWidget {
  final item catalog;

  const AddToCart({Key? key, required this.catalog}) : super(key: key);

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items.contains(widget.catalog) ?? false;
    return ElevatedButton(
        onPressed: () {
          if (!isInCart) {
            isInCart = isInCart.toggle();
            final _catalog = CatalogModels();

            _cart.add(widget.catalog);
            _cart.catalog = _catalog;
            setState(() {});
          }
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(context.theme.buttonColor),
          shape: MaterialStateProperty.all(StadiumBorder()),
        ),
        child: isInCart ? Icon(Icons.done) :Icon(CupertinoIcons.cart_badge_plus));
  }
}
