import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Image.asset(
              "assets/images/login.png",
              fit: BoxFit.cover
          ),
        SizedBox(
          height:20.0,
        ),
        const Text("Welcome",
          textAlign: TextAlign.center,
          style:TextStyle(fontSize: 40,
              fontWeight: FontWeight.bold,
          color: Colors.deepPurple),
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
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                    hintText: "Enter Password ",
                    labelText: "Password"
                ),
              ),
              SizedBox(
                height:20.0,
              ),
              ElevatedButton(
                   child: Text("Login"),
                style: TextButton.styleFrom(),
                onPressed: (){
                     print("hello world");
                },
    )
            ],
          )
            ,) 
        ],
      )
    );

  }
}
