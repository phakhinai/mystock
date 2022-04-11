import 'package:flutter/cupertino.dart';
import 'package:mystock/src/pages/pages.dart';

class Route {
  static const login = '/login';
  static const home = '/home';

  static Map<String, WidgetBuilder> getAll() => _route;

  static final Map<String, WidgetBuilder> _route = {
    login : (context) => LoginPage(),
    home : (context) => HomePage(),
  };
}
