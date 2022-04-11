import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mystock/src/config/route.dart' as custom_route;
import 'package:mystock/src/constants/setting.dart';
import 'package:mystock/src/pages/home/home_page.dart';
import 'package:mystock/src/pages/login/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: custom_route.Route.getAll(),
      title: 'MyStock',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.kanitTextTheme(),
      ),
      home: FutureBuilder<SharedPreferences>(
        future: SharedPreferences.getInstance(),
        builder:
            (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
          if (snapshot.hasData) {
            final token = snapshot.data?.getString(Setting.TOKEN_PREF) ?? '';
            if (token.isNotEmpty) {
              return const HomePage();
            }
            return const LoginPage();
          }
          return const SizedBox();
        },
      ),
    );
  }
}
