import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mystock/src/config/route.dart' as custom_route;
import 'package:mystock/src/config/theme.dart' as custom_theme;
import 'package:mystock/src/constants/setting.dart';
import 'package:mystock/src/pages/login/configs/text_config.dart'
    as login_config;
import 'package:mystock/src/utils/regex_validator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late TextEditingController usernameController;
  late TextEditingController passwordController;

  String? _errorUsername;
  String? _errorPassword;

  @override
  void initState() {
    usernameController = TextEditingController();
    passwordController = TextEditingController();

    // defult value on Testing
    usernameController.text = '0000000000';
    passwordController.text = '12345678';

    super.initState();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        _buildForm(),
        _buildSubmitFormButton(),
      ],
    );
  }

  Card _buildForm() => Card(
        margin: const EdgeInsets.only(bottom: 22, left: 22, right: 22),
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
              top: 20.0, bottom: 50.0, left: 20, right: 20),
          child: FormInput(
            usernameController: usernameController,
            passwordController: passwordController,
            errorUsername: _errorUsername,
            errorPassword: _errorPassword,
          ),
        ),
      );

  Container _buildSubmitFormButton() => Container(
        width: 300,
        height: 50,
        decoration: _boxDecoration(),
        child: ElevatedButton(
          onPressed: _onLogin,
          child: Text(
            login_config.TextConfig.loginButtonText,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 25.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: custom_theme.Theme.gradientStart,
          ),
        ),
      );

  BoxDecoration _boxDecoration() {
    const primaryColor = custom_theme.Theme.primaryColor;

    // ignore: prefer_function_declarations_over_variables
    final boxShadowItem = (Color color) => BoxShadow(
          color: color,
          offset: const Offset(1.0, 6.0),
          blurRadius: 20.0,
        );

    return BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(5.0)),
      boxShadow: [
        boxShadowItem(primaryColor),
      ],
    );
  }

  void showAlertBar() {
    Flushbar(
      title: 'หมายเลขโทรศัพท์หรือรหัสผ่านไม่ถูกต้อง',
      message: 'กรุณากรอกข้อมูลอีกครั้ง',
      icon: Icon(
        Icons.error_outline,
        size: 28.0,
        color: Colors.red[300],
      ),
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(8.0),
      borderRadius: BorderRadius.circular(8.0),
      leftBarIndicatorColor: Colors.red[300],
    ).show(context);
  }

  void showLoading() {
    Flushbar(
      message: 'กรุณารอซักครู่...',
      showProgressIndicator: true,
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.GROUNDED,
    ).show(context);
  }

  void _onLogin() {
    String username = usernameController.text;
    String password = passwordController.text;

    _errorUsername = null;
    _errorPassword = null;

    if (!PhoneNumberSubmitRegexValidator().isValid(username)) {
      _errorUsername = 'กรุณากรอกข้อมูลหมายเลขโทรศัพท์ให้ถูกต้อง';
    }

    if (password.length < 8) {
      _errorPassword = 'กรุณากรอกรหัสผ่านมากกว่า 8 ตัวอักษร';
    }

    if (_errorUsername == null && _errorPassword == null) {
      showLoading();
      Future.delayed(const Duration(milliseconds: 1300)).then((value) async {
        Navigator.pop(context);
        if (username == '0000000000' && password == '12345678') {

          // Obtain shared preferences.
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString(Setting.TOKEN_PREF, 'token_wkdpqwokf932fk0fejqf9jp3f');
          await prefs.setString(Setting.USERNAME_PREF, username);

          Navigator.pushReplacementNamed(
            context,
            custom_route.Route.home,
          );
        } else {
          showAlertBar();
        }
        setState(() {});
      });
    } else {
      setState(() {});
    }
  }
}

class FormInput extends StatefulWidget {
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final String? errorUsername;
  final String? errorPassword;

  const FormInput({
    Key? key,
    required this.usernameController,
    required this.passwordController,
    required this.errorUsername,
    required this.errorPassword,
  }) : super(key: key);

  @override
  State<FormInput> createState() => _FormInputState();
}

class _FormInputState extends State<FormInput> {
  late bool _obscureTextPassword;
  final _passwordFocusNode = FocusNode();

  @override
  void initState() {
    _obscureTextPassword = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildUsername(),
        const Divider(
          height: 22,
          thickness: 1,
          indent: 22,
          endIndent: 22,
        ),
        _buildPassword(),
      ],
    );
  }

  TextField _buildUsername() => TextField(
        controller: widget.usernameController,
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: login_config.TextConfig.usernameLabelText,
          hintText: login_config.TextConfig.usernameHintText,
          icon: const FaIcon(
            FontAwesomeIcons.squarePhone,
            size: 22.0,
          ),
          errorText: widget.errorUsername,
        ),
        keyboardType: TextInputType.phone,
        textInputAction: TextInputAction.next,
        onSubmitted: (String value) {
          FocusScope.of(context).requestFocus(_passwordFocusNode);
        },
      );

  TextField _buildPassword() => TextField(
        focusNode: _passwordFocusNode,
        controller: widget.passwordController,
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: login_config.TextConfig.passwordLabelText,
          hintText: login_config.TextConfig.passwordHintText,
          icon: const FaIcon(
            FontAwesomeIcons.lock,
            size: 22.0,
          ),
          errorText: widget.errorPassword,
          suffixIcon: IconButton(
            icon: FaIcon(
              _obscureTextPassword
                  ? FontAwesomeIcons.eye
                  : FontAwesomeIcons.eyeSlash,
              size: 18.0,
              color: Colors.grey,
            ),
            onPressed: () {
              setState(() {
                _obscureTextPassword = !_obscureTextPassword;
              });
            },
          ),
        ),
        obscureText: _obscureTextPassword,
      );
}
