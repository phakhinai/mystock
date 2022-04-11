import 'package:flutter/material.dart';
import 'package:mystock/src/pages/login/configs/text_config.dart'
    as login_config;
import 'package:mystock/src/pages/login/configs/theme.dart' as login_theme;

class MenuForm extends StatelessWidget {
  const MenuForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildDivider(),
        _buildLoginPinButton(),
        _buildRegisterButton(),
        _buildForgotPasswordButton(),
        buildRookieButton(),
      ],
    );
  }

  Container buildRookieButton() {
    return Container(
      margin: const EdgeInsets.only(bottom: 12.0),
      width: 300,
      height: 50,
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          login_config.TextConfig.rookieButtonText,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: login_theme.Theme.rookieButtonColor,
        ),
      ),
    );
  }

  Container _buildForgotPasswordButton() {
    return Container(
      margin: const EdgeInsets.only(bottom: 12.0),
      width: 300,
      height: 50,
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          login_config.TextConfig.forgotPasswordButtonText,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: login_theme.Theme.forgotPasswordButtonColor,
        ),
      ),
    );
  }

  Container _buildRegisterButton() {
    return Container(
      margin: const EdgeInsets.only(bottom: 12.0),
      width: 300,
      height: 50,
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          login_config.TextConfig.registerButtonText,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: login_theme.Theme.registerButtonColor,
        ),
      ),
    );
  }

  Container _buildLoginPinButton() {
    return Container(
      margin: const EdgeInsets.only(bottom: 12.0),
      width: 300,
      height: 50,
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          login_config.TextConfig.pinLoginButtonText,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: login_theme.Theme.pinButtonColor,
        ),
      ),
    );
  }

  _buildDivider() {
    // ignore: prefer_function_declarations_over_variables
    final line = (List<Color> _colors) => Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: _colors,
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              stops: const [0.0, 1.0],
            ),
          ),
          width: 80.0,
          height: 1.0,
        );

    return Container(
      margin: const EdgeInsets.only(bottom: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          line([Colors.white10, Colors.white]),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(
              'or',
              style: TextStyle(
                color: Colors.white60,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          line([Colors.white, Colors.white10]),
        ],
      ),
    );
  }
}
