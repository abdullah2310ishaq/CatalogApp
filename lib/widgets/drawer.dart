import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final imageUrl =
        "https://media.licdn.com/dms/image/D4D03AQFsVgxJtpV3Dw/profile-displayphoto-shrink_400_400/0/1694074754077?e=1701302400&v=beta&t=6E4vIJcOgzDZAuSaEqfhfdx_FMmUeUPY5r8kkd4zCMk";
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
                child:UserAccountsDrawerHeader(
                  margin: EdgeInsets.zero,


                  accountName: Text("Abdullah Ishaq"),
                  accountEmail: Text("abcd@gmail.com"),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(imageUrl),
                  ),

            ),
            ),

            ListTile(
              leading: Icon(
                  CupertinoIcons.home,
              color: Colors.white,

                ),
              title:Text(
                  "Home",
                  textScaleFactor: 1.0,

                  style:
                  TextStyle(
                    color: Colors.white,

            )
              ),
            ),


            ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,

              ),
              title:Text(
                  "Profile",
                  textScaleFactor: 1.0,

                  style:
                  TextStyle(
                    color: Colors.white,

                  )
              ),
            ),


            ListTile(
              leading: Icon(
                CupertinoIcons.mail,
                color: Colors.white,

              ),
              title:Text(
                  "Email",
                  textScaleFactor: 1.0,

                  style:
                  TextStyle(
                    color: Colors.white,

                  )
              ),
            ),



































          ],
        ),
      ),
    );
  }
}
