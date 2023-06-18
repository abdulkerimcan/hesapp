import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hesapp/core/constants/app_routes.dart';
import 'package:hesapp/core/constants/asset_constants.dart';
import 'package:hesapp/core/constants/language_items.dart';
import 'package:hesapp/core/constants/regex_constants.dart';
import 'package:hesapp/core/extension/contex_extension.dart';
import 'package:hesapp/features/auth/login/viewmodel/login_viewmodel.dart';

@RoutePage()
class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends LoginViewModel {
  TextEditingController mailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        image: _backgroundImage(),
      ),
      child: isLoading
          ? const CircularProgressIndicator(
              color: Colors.yellow,
            )
          : Container(
              decoration: _backgroundContainerDecoration(),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Form(
                  key: _formkey,
                  child: Container(
                    padding: context.paddingNormal,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: context.paddingNormalVertical,
                          child: _emailTextForm(),
                        ),
                        _passwordTextField(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _signUpButton(context),
                            _forgetPasswordButton(context)
                          ],
                        ),
                        _loginButton(context)
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }

  BoxDecoration _backgroundContainerDecoration() {
    return const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.center,
            colors: [Colors.black12, Colors.black54]));
  }

  DecorationImage _backgroundImage() {
    return const DecorationImage(
        image: AssetImage(AssetConstants.backgroundImage), fit: BoxFit.cover);
  }

  TextFormField _emailTextForm() {
    return TextFormField(
      controller: mailTextEditingController,
      keyboardType: TextInputType.emailAddress,
      decoration: _inputDecoration(Icons.mail, LanguageItems.enterYourEmail),
      validator: (value) {
        if (value != null && value.isEmpty) {
          return LanguageItems.enterYourEmail;
        }
        if (!RegExp(RegexConstants.emailRegex).hasMatch(value!)) {
          return LanguageItems.enterValidEmail;
        }
        return null;
      },
    );
  }

  TextField _passwordTextField() {
    return TextField(
      controller: passwordTextEditingController,
      obscureText: true,
      decoration: _inputDecoration(Icons.lock, LanguageItems.enterPassword),
    );
  }

  TextButton _signUpButton(BuildContext context) {
    return TextButton(
        onPressed: () {
          context.router.replaceNamed(AppRoutes.routeAuthSignUp);
        },
        child: Text(
          LanguageItems.signUp,
          style: Theme.of(context).textTheme.bodyLarge,
        ));
  }

  TextButton _forgetPasswordButton(BuildContext context) {
    return TextButton(
        onPressed: () {},
        child: Text(
          LanguageItems.forgetYourPassword,
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(decoration: TextDecoration.underline),
        ));
  }

  ElevatedButton _loginButton(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(context.width * 0.5, context.height * 0.05),
        ),
        onPressed: () {
          if (_formkey.currentState?.validate() ?? false) {
            login(mailTextEditingController.text,
                passwordTextEditingController.text);
          }
        },
        child: Text(
          LanguageItems.login,
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(color: Colors.black),
        ));
  }

  InputDecoration _inputDecoration(IconData iconData, String labelText) {
    return InputDecoration(
        prefixIcon: Icon(iconData),
        prefixIconColor: Colors.white,
        filled: true,
        fillColor: Colors.white38,
        border: const OutlineInputBorder(),
        labelText: labelText);
  }
}
