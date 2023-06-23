import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hesapp/core/constants/app_routes.dart';
import 'package:hesapp/core/constants/asset_constants.dart';
import 'package:hesapp/core/constants/language_items.dart';
import 'package:hesapp/core/constants/regex_constants.dart';
import 'package:hesapp/core/extension/contex_extension.dart';
import 'package:hesapp/features/auth/signup/viewmodel/sign_up_viewmodel.dart';

@RoutePage()
class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends SignUpViewModel {
  String name = "", email = "", phone = "";
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: _backgroundImage(),
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
                        _usernameTextForm(),
                        Padding(
                          padding: context.paddingNormalVertical,
                          child: _phoneTextForm(),
                        ),
                        _passwordTextForm(),
                        Padding(
                          padding: context.paddingNormalVertical,
                          child: _confirmPasswordTextForm(),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [_alreadyHaveAccountTextButton(context)],
                        ),
                        _signUpButton(context)
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }

  ElevatedButton _signUpButton(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(context.width * 0.5, context.height * 0.05),
        ),
        onPressed: () {
          if (_formkey.currentState?.validate() ?? false) {
            register(usernameController.text, emailController.text,
                password.text, phoneController.text);
          }
        },
        child: Text(
          LanguageItems.signUp,
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(color: Colors.black),
        ));
  }

  TextButton _alreadyHaveAccountTextButton(BuildContext context) {
    return TextButton(
        onPressed: () {
          context.router.replaceNamed(AppRoutes.routeAuthLogin);
        },
        child: Text(
          LanguageItems.alreadyHaveAccount,
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(decoration: TextDecoration.underline),
        ));
  }

  TextFormField _confirmPasswordTextForm() {
    return TextFormField(
      controller: confirmPassword,
      obscureText: true,
      decoration: _inputDecoration(Icons.lock, LanguageItems.confirmPassword),
      validator: (value) {
        if (value != null && value.isEmpty) {
          return LanguageItems.enterPassword;
        }
        if (password.text != confirmPassword.text) {
          return LanguageItems.passwordsDoesntMatch;
        }
        return null;
      },
    );
  }

  TextFormField _passwordTextForm() {
    return TextFormField(
      controller: password,
      obscureText: true,
      decoration: _inputDecoration(Icons.lock, LanguageItems.enterPassword),
      validator: (value) {
        if (value != null && value.isEmpty) {
          return LanguageItems.enterPassword;
        }
        return null;
      },
    );
  }

  TextFormField _phoneTextForm() {
    return TextFormField(
      controller: phoneController,
      decoration: _inputDecoration(Icons.person, LanguageItems.enterPhone),
    );
  }

  TextFormField _usernameTextForm() {
    return TextFormField(
      controller: usernameController,
      decoration: _inputDecoration(Icons.person, LanguageItems.enterUsername),
    );
  }

  TextFormField _emailTextForm() {
    return TextFormField(
      controller: emailController,
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
      onSaved: (newValue) {
        if (newValue != null && newValue.isNotEmpty) {
          email = newValue;
        }
      },
    );
  }

  BoxDecoration _backgroundImage() {
    return const BoxDecoration(
      image: DecorationImage(
          image: AssetImage(AssetConstants.backgroundImage), fit: BoxFit.cover),
    );
  }

  BoxDecoration _backgroundContainerDecoration() {
    return const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.center,
            colors: [Colors.black12, Colors.black54]));
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
