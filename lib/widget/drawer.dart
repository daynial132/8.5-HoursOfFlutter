import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageUrl =
        "https://yt3.ggpht.com/ytc/AKedOLS3bbcK2UnaNaAkVZLd05B-quot0SwRY-rjYAnYZQ=s900-c-k-c0x00ffffff-no-rj";
    return Drawer(
        child: ListView(
            padding: EdgeInsets.zero,
            children: [
            DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                ),
                accountName: Text("Daynial"),
                accountEmail: Text("khandaynial_2000@hotmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
                )
            )
        ),
        ListTile(
            leading: Icon(
              CupertinoIcons.home,
              color: Colors.grey,
            ),
            title:Text("Home",
            textScaleFactor: 1.5,
             style: TextStyle(
                color: Colors.grey,
              ),
            ),
    ),
              ListTile(
                leading: Icon(
                  CupertinoIcons.profile_circled,
                  color: Colors.grey,
                ),
                title:Text("Profile",
                  textScaleFactor: 1.5,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  CupertinoIcons.mail,
                  color: Colors.grey,
                ),
                title:Text("Mail",
                  textScaleFactor: 1.5,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              )
            ],
    )
    ,
    );
  }
}
