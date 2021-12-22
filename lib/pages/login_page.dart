import 'package:flutter/material.dart';
import 'package:untitled/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      child:SingleChildScrollView(
      child: Column(
        children: [
          Image.asset(
              "assets/images/login.png",
              fit: BoxFit.cover,
              height:300,
          ),
        SizedBox(
          height:20.0,
        ),
         Text(
          "Welcome $name",
          textAlign: TextAlign.center,
          style:TextStyle(fontSize: 25,
              fontWeight: FontWeight.bold,
          color: Colors.grey),
        ),

          Padding(padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 32.0),
          child:
          Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                    hintText: "Enter User Name",
                    labelText: "User Name"
                ),
                onChanged: (value){
                  name = value;
                  setState(() {

                  });
                },
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                    hintText: "Enter Password ",
                    labelText: "Password"
                ),
              ),
              SizedBox(
                height:40.0,
              ),
     InkWell(
       onTap: () async{
         setState(() {
           changeButton = true;
         });
         await Future.delayed(Duration(seconds: 1));
         Navigator.pushNamed(context, MyRoutes.homeRoute);
       },
       child: AnimatedContainer(
         duration: Duration(seconds: 1),
         width: changeButton? 50 : 150,
         height: 50,
        // color: Colors.deepPurple,
         alignment: Alignment.center,
         child: changeButton?Icon(Icons.done,color: Colors.green,):
         Text("Login",
         style:TextStyle(
         color:Colors.white,
         fontSize: 15,
           fontWeight: FontWeight.bold,
         ),
       ),
         decoration: BoxDecoration(
           color: Colors.deepPurple,
         // shape: changeButton?BoxShape.circle:BoxShape.rectangle
           borderRadius: BorderRadius.circular(changeButton ? 50 : 8),
         ),
        ),
     )
     /*         ElevatedButton(
                   child: Text("Login"),
                style: TextButton.styleFrom(minimumSize: Size(100, 50)),
                onPressed: (){
                   //  print("hello world");
                  Navigator.pushNamed(context, MyRoutes.homeRoute);
                },
    )*/
            ],
          )
            ,)
        ],
      )
      )
    );

  }
}
