import 'package:chat_app/Pages/settings_page.dart';
import 'package:chat_app/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import '../pages/login_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer();
  void logout(BuildContext context) {
    final authService = AuthService();
    authService.signOut().then((_) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
        (Route<dynamic>route)=>false
      );
    },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: DrawerHeader(
                    child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(40),
                    child: Image.asset(
                      'lib/images/message.png',
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                )),
              ),
              Padding(
                padding: EdgeInsets.only(left: 25, top: 10),
                child: ListTile(
                  title: Text('HOME'),
                  leading: Icon(Icons.home),
                  onTap: () => Navigator.pop(context),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 25, top: 0), 
                child: ListTile(
                  title: Text('SETTINGS'),
                  leading: Icon(Icons.settings),
                  onTap: (){
                    Navigator.pop(context);
                    Navigator.push(context,
                     MaterialPageRoute(builder: (context) => SettingsPage()
                     ),
                    );
                    },
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 25,bottom: 25),
            child: ListTile(
              title: Text('LOGOUT'),
              leading: Icon(Icons.logout),
              onTap: ()=>logout(context),
            ),
          ),
          
        ],
      ),

    );
  }
}