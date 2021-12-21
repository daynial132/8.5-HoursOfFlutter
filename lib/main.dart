import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/pages/home_page.dart';
import 'package:untitled/pages/login_page.dart';

void main(){
  runApp(MyApp());
}
    
class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double days = 30;
    return MaterialApp(
   //   home:HomePage(),
      themeMode: ThemeMode.dark,
      theme: ThemeData(primarySwatch:Colors.lightGreen),
      darkTheme: ThemeData(
       brightness: Brightness.light,
        primarySwatch:Colors.deepPurple
      ),
      initialRoute: "/home",
      routes: {
        "/" :(context) => LoginPage(),
        "/home": (context) => HomePage(),
        "/login": (context) => LoginPage(),
      },

    );
  }
}
