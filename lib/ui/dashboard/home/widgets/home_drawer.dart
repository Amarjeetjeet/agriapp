import 'package:agriapp/data/helper/barrel.dart';
import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: primaryColor,
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          buildListTile(iconName: cart, name: 'My Order', onTap: () {  }),
          buildListTile(iconName: setting, name: 'Setting', onTap: () {  }),
          buildListTile(iconName: location, name: 'My Address', onTap: () {  }),
          buildListTile(iconName: cart, name: 'Change Password', onTap: () {  }),
          buildListTile(iconName: cart, name: 'Contact Us', onTap: () {  }),
          buildListTile(iconName: cart, name: 'Terms & Conditions', onTap: () {  }),
          buildListTile(iconName: cart, name: 'Logout', onTap: () {  }),
        ],
      ),
    );
  }

  ListTile buildListTile({required String iconName, required String name , required void Function()? onTap}) {
    return ListTile(
      leading: SvgHelper(
        imagePath: iconName,
      ),
      title: Text(name,style: txtMediumF16cWhite,),
      onTap: onTap,
    );
  }
}
