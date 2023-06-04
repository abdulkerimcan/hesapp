import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hesapp/core/init/navigator/app_router.dart'; 

@RoutePage()
class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/background.jpg"),
            fit: BoxFit.cover),
      ),
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.center,
                colors: [Colors.black12, Colors.black54])),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: _inputDecoration(Icons.mail, "Enter your email"),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  obscureText: true,
                  decoration:
                      _inputDecoration(Icons.lock, "Enter your password"),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {
                          context.router.push(const SignupViewRoute());
                        },
                        child: Text(
                          "Sign Up",
                          style: Theme.of(context).textTheme.bodyLarge,
                        )),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Forgot Your Password?",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(decoration: TextDecoration.underline),
                        ))
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        minimumSize: const Size(200, 40),
                        elevation: 0,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(50)))),
                    onPressed: () {},
                    child: Text(
                      "Login",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(color: Colors.black),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
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
