import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Drawer(
      backgroundColor: Colors.pink,
      child: SingleChildScrollView(
        child: Column(
          children: [
            DrawerHeader(child: Icon(Icons.favorite)),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('HOME'),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('ABOUT US'),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('WHY ABCD'),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('FEATURES'),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('BLOG/NEWS'),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('HOW IT WORKS'),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('SECURITY'),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('FAQs'),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('CONTACT US'),
            ),
          ],
        ),
      ),
    );
  }
}
