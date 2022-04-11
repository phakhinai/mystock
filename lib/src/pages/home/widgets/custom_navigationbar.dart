import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({Key? key}) : super(key: key);

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          label: 'Stock',
          icon: FaIcon(FontAwesomeIcons.house),
        ),
        BottomNavigationBarItem(
          label: 'Chart',
          icon: FaIcon(FontAwesomeIcons.chartLine),
        ),
        BottomNavigationBarItem(
          label: 'Report',
          icon: FaIcon(FontAwesomeIcons.noteSticky),
        ),
      ],
    );
  }
}
