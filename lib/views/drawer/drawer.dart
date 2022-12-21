import 'package:flutter/material.dart';
import 'package:midterm/constant/routes.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Pages',),
          ),
          ListTile(
            leading: const Icon(Icons.home, color: Colors.blue,),
            title: const Text('Home'),
            onTap: () async {
              await Navigator.pushNamedAndRemoveUntil(context, homepageRoute, (route) => false);
            },
          ),
          ListTile(
            leading: const Icon(Icons.search, color: Colors.blue,),
            title: const Text('Search'),
            onTap: () async {
              await Navigator.of(context).pushNamed(searchRoute);
            },
          ),
          ListTile(
            leading: const Icon(Icons.location_city, color: Colors.blue,),
            title: const Text('Favorite Hotel'),
            onTap: () async {
              await Navigator.pushNamed(context, favoritedHotelRoute);
            },
          ),
          ListTile(
            leading: const Icon(Icons.person, color: Colors.blue,),
            title: const Text('My Page'),
            onTap: () async {
              await Navigator.pushNamed(context, myPageRoute);
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.blue,),
            title: const Text('Log Out'),
            onTap: () async {
              await Navigator.pushNamedAndRemoveUntil(context, loginRoute, (route) => false);
            },
          ),
        ],
      ),
    );
  }
}
