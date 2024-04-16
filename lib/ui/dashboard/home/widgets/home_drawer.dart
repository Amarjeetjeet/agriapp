import 'package:agriapp/data/data_source/local/preference_util/preference_utils.dart';
import 'package:agriapp/data/helper/barrel.dart';
import 'package:agriapp/data/helper/widgets/utils.dart';
import 'package:agriapp/ui/auth/password/change_password/change_password_ui.dart';
import 'package:agriapp/ui/cart/address/billing_address.dart';
import 'package:agriapp/ui/order/my_orders/my_orders.dart';
import 'package:agriapp/ui/static_web_pages/about_us.dart';
import 'package:agriapp/ui/static_web_pages/contact_us.dart';
import 'package:agriapp/ui/static_web_pages/term_and_condition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/blocs/address_cubit/address_cubit.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: primaryColor,
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Image.asset(leaf),
          ),
          SafeArea(
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: [
                20.0.height(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 32,
                        backgroundImage: AssetImage(user),
                      ),
                      10.0.height(),
                      Text(
                        PreferenceUtils.getString(
                          PreferenceUtils.USERNAME,
                        ),
                        style: txtMediumF20cWhite,
                      ),
                      Text(
                        PreferenceUtils.getString(
                          PreferenceUtils.USER_EMAIL,
                        ),
                        style: txtRegularF16cWhite,
                      ),
                    ],
                  ),
                ),
                50.0.height(),
                buildListTile(
                  iconName: cart,
                  name: 'My Order',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => const MyOrders(),
                      ),
                    );
                  },
                ),
                // buildListTile(
                //   iconName: setting,
                //   name: 'Setting',
                //   onTap: () {},
                // ),
                buildListTile(
                  iconName: location,
                  name: 'My Address',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => BlocProvider(
                          create: (context) => AddressCubit()..getShippingAddress(),
                          child: const BillingAddress(),
                        ),
                      ),
                    );
                  },
                ),
                buildListTile(
                  iconName: cart,
                  name: 'Change Password',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const ChangePasswordUi(),
                      ),
                    );
                  },
                ),
                buildListTile(
                  iconName: share,
                  name: 'Invite Your Friends',
                  onTap: () {},
                ),
                buildListTile(
                  iconName: headphones,
                  name: 'Contact Us',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => const ContactUs(),
                      ),
                    );
                  },
                ),
                buildListTile(
                  iconName: headphones,
                  name: 'About us',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => const AboutUs(),
                      ),
                    );
                  },
                ),
                buildListTile(
                  iconName: file,
                  name: 'Terms & Conditions',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const TermAndConditionsPage(),
                      ),
                    );
                  },
                ),
                buildListTile(
                  iconName: exit,
                  name: 'Logout',
                  onTap: () {
                    Utils(context).showLogoutAlert();
                  },
                ),
                50.0.height(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ListTile buildListTile(
      {required String iconName,
      required String name,
      required void Function()? onTap}) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      leading: SvgHelper(
        imagePath: iconName,
      ),
      title: Text(
        name,
        style: txtMediumF16cWhite,
      ),
      onTap: onTap,
    );
  }
}
