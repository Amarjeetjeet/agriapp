import 'package:agriapp/data/data_source/local/preference_util/preference_utils.dart';
import 'package:agriapp/data/router/rounter_config.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../data_source/local/database_helper/database_helper.dart';

class Utils {
  late BuildContext context;

  Utils(this.context);

  // this is where you would do your fullscreen loading
  Future<void> startLoading() async {
    return await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const SimpleDialog(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          // can change this to your prefered color
          children: <Widget>[
            Center(
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(24.0),
                  child: CircularProgressIndicator(),
                ),
              ),
            )
          ],
        );
      },
    );
  }

  Future<void> stopLoading() async {
    Navigator.of(context).pop();
  }

  Future<void> showLogoutAlert() async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog.adaptive(
          title: const Text(
            'Logout',
            style: TextStyle(color: Colors.black),
          ),
          content: const Text(
            'Are you sure you want to logout?',
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Close the alert dialog
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                await DatabaseHelper.clearCart();
                await PreferenceUtils.reset();
                if (context.mounted) {
                  context.go(RouterUtil.loginUi);
                }
              },
              child: const Text('Logout'),
            ),
          ],
        );
      },
    );
  }

// Future<void> showError(Object? error) async {
//   ScaffoldMessenger.of(context).showSnackBar(
//     SnackBar(
//       action: SnackBarAction(
//         label: 'Dismiss',
//         onPressed: () {
//           ScaffoldMessenger.of(context).hideCurrentSnackBar();
//         },
//       ),
//       backgroundColor: Colors.red,
//       content: Text(handleError(error)),
//     ),
//   );
// }
}
