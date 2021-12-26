import 'package:flutter/material.dart';
import 'package:untitled/models/catalog.dart';
class ItemWidget extends StatelessWidget {
  final item items;

  const ItemWidget({Key? key, required this.items}) : assert(items != null) ,super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
     // elevation: 0.0,
      child: ListTile(
        leading: Image.network(items.image),
        title: Text(items.Name),
        subtitle: Text(items.Description),
        trailing: Text("\$${items.Price}",
        textScaleFactor: 1.2,
        style: TextStyle(
            color: Colors.redAccent,
          fontWeight: FontWeight.bold,

        ),),
      ),
    );
  }
}
