import 'package:flutter/material.dart';
import 'package:mystock/src/config/theme.dart' as custom_theme;
import 'package:mystock/src/pages/home/configs/text_config.dart'
    as custom_home_text;
import 'package:mystock/src/pages/home/widgets/custom_drawer.dart';
import 'package:mystock/src/pages/home/widgets/custom_tabbar.dart';
import 'package:mystock/src/viewmodels/tabmenu_view_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _tabsMenu = TabMenuViewModel().items;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabsMenu.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: custom_theme.Theme.primaryColor,
          title: Text(custom_home_text.TextConfig.pageName),
          bottom: CustomTabBar(_tabsMenu),
        ),
        drawer: const CustomDrawer(),
        body: TabBarView(
          children: _tabsMenu.map((item) => item.widget).toList(),
        ),
      ),
    );
  }
}
