import 'package:flutter/material.dart';
import 'package:mystock/src/config/theme.dart' as custom_theme;
import 'package:mystock/src/pages/login/configs/text_config.dart' as custom_login_text;
import 'package:mystock/src/pages/login/widgets/header.dart';
import 'package:mystock/src/pages/login/widgets/login_form.dart';
import 'package:mystock/src/pages/login/widgets/menu_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: custom_theme.Theme.primaryColor,
        title: Text(custom_login_text.TextConfig.pageName),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            height: 800,
          ),
          Container(
            decoration: const BoxDecoration(
              gradient: custom_theme.Theme.gradient,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 5, right: 5),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Header(),
                  const LoginForm(),
                  Container(
                      margin: const EdgeInsets.only(left: 22, right: 22),
                      alignment: Alignment.centerRight,
                      child:
                          _buildTextButton('ลืมรหัสผ่าน ?', onPressed: () {})),
                  const MenuForm(),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  TextButton _buildTextButton(
    String text, {
    required VoidCallback onPressed,
    double fontSize = 16,
  }) =>
      TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSize,
            fontWeight: FontWeight.normal,
          ),
        ),
      );
}
