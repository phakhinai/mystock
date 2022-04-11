import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mystock/src/pages/home/tabs/chart.dart';
import 'package:mystock/src/pages/home/tabs/report.dart';
import 'package:mystock/src/pages/home/tabs/stock.dart';

class TabMenu {
  final String title;
  final IconData? icon;
  final Widget widget;

  const TabMenu(this.title, this.widget, {this.icon});
}

class TabMenuViewModel {
  List<TabMenu> get items => <TabMenu>[
        const TabMenu('Stock', Stock(), icon: FontAwesomeIcons.box),
        const TabMenu('Chart', Chart(), icon: FontAwesomeIcons.chartSimple),
        const TabMenu('Report', Report(), icon: FontAwesomeIcons.fileAlt),
      ];
}
