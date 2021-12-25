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
        child: SingleChildScrollView(
            child: Column(
      children: [
        Image.asset(
          "assets/images/hey.png",
          fit: BoxFit.cover,
          height: 300,
        ),
        SizedBox(
          height: 20.0,
        ),
        Text(
          "Welcome $name",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.grey),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                    hintText: "Enter User Name", labelText: "User Name"),
                onChanged: (value) {
                  name = value;
                  setState(() {});
                },
              ),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                    hintText: "Enter Password ", labelText: "Password"),
              ),
              const SizedBox(
                height: 40.0,
              ),
              Material(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(changeButton ? 50 : 8),
                child: InkWell(
                  onTap: () async {
                    setState(() {
                      changeButton = true;
                    });
                    await Future.delayed(const Duration(seconds: 1));
                    await Navigator.pushNamed(context, MyRoutes.homeRoute);
                    setState(() {
                      changeButton = false;
                    }); },
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    width: changeButton ? 50 : 150,
                    height: 50,
                    // color: Colors.deepPurple,
                    alignment: Alignment.center,
                    child: changeButton
                        ? const Icon(
                            Icons.done,
                            color: Colors.white,
                          )
                        : const Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    )));
  }
}
