import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  final days = 20;
    return Scaffold (
      appBar: AppBar(
        title: Text("MyApp"),
      ),
        body: Center  (
          child: Container(
            child: Text("Welcome to My App for $days days"),
          ),
        ),
        drawer: Drawer(),
    );
  }
}
