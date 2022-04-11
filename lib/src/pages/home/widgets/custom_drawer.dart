import 'package:flutter/material.dart';
import 'package:mystock/src/config/route.dart' as custom_route;
import 'package:mystock/src/config/theme.dart' as custom_theme;
import 'package:mystock/src/constants/setting.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          _buildProfile(),
          const Spacer(),
          ListTile(
            title: const Text(
              'ออกจากระบบ',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            onTap: showDialogLogout,
          ),
        ],
      ),
    );
  }

  void showDialogLogout() {
    showDialog<void>(
      context: context,
      barrierDismissible: true,
      // false = user must tap button, true = tap outside dialog
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          content: const Text('ต้องการออกจากระบบใช่หรือไม่ ?'),
          actions: <Widget>[
            TextButton(
              child: const Text('ยกเลิก'),
              onPressed: () {
                Navigator.of(dialogContext).pop(); // Dismiss alert dialog
              },
            ),
            TextButton(
              child: const Text(
                'ออกจากระบบ',
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () {
                SharedPreferences.getInstance()
                    .then((prefs) => prefs.remove(Setting.TOKEN_PREF));
                Navigator.of(dialogContext).pop(); // Dismiss alert dialog
                Navigator.pushNamedAndRemoveUntil(
                    context, custom_route.Route.login, (route) => false);
              },
            ),
          ],
        );
      },
    );
  }

  UserAccountsDrawerHeader _buildProfile() =>
      const UserAccountsDrawerHeader(
        decoration: BoxDecoration(
          color: custom_theme.Theme.primaryColor
        ),
        accountName: Text('iBlurBlur DotDev'),
        accountEmail: Text('phakhinai@gmail.com'),
        currentAccountPicture: CircleAvatar(
          backgroundImage: AssetImage('assets/images/avartar.png'),
        ),
      );
}
