import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  String name = "", email = "", phone = "";

  //TextController to read text entered in text field
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

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
          body: Form(
            key: _formkey,
            child: Container(
              padding: const EdgeInsets.all(32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration:
                        _inputDecoration(Icons.mail, "Enter your email"),
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return "Please enter your Email";
                      }
                      if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                          .hasMatch(value!)) {
                        return 'Please a valid Email';
                      }
                      return null;
                    },
                    onSaved: (newValue) {
                      if (newValue != null && newValue.isNotEmpty) {
                        email = newValue;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: password,
                    obscureText: true,
                    decoration:
                        _inputDecoration(Icons.lock, "Enter your password"),
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return "Please enter your password";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: confirmpassword,
                    obscureText: true,
                    decoration:
                        _inputDecoration(Icons.lock, "Confirm your password"),
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return "Please enter your password";
                      }
                      if (password.text != confirmpassword.text) {
                        return "Passwords Doesn't match";
                      }
                      return null;
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "Already have account?",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(
                                    decoration: TextDecoration.underline),
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
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          //kayıt et
                          context.router.replaceNamed("/home");
                          return;
                        } else {
                          //başarısız
                        }
                      },
                      child: Text(
                        "Sign up",
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
