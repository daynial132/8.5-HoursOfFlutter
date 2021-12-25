import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/widget/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final days = 20;
    return Scaffold(
      appBar: AppBar(
/*
        backgroundColor: Colors.white,
        elevation:0.0,
        iconTheme: IconThemeData(color: Colors.green),
        title: Text("MyApp",style: TextStyle(color: Colors.green)),
*/
        title: Text(
          "Catalog App",
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: Text("Welcome to My App for $days days"),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
