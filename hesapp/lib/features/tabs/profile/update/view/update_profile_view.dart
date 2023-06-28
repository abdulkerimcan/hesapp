import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hesapp/core/constants/asset_constants.dart';
import 'package:hesapp/core/constants/language_items.dart';
import 'package:hesapp/core/extension/contex_extension.dart';
import 'package:hesapp/features/tabs/profile/update/viewmodel/update_profile_viewmodel.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

@RoutePage()
class UpdateProfileView extends StatefulWidget {
  const UpdateProfileView({super.key});

  @override
  State<UpdateProfileView> createState() => _UpdateProfileViewState();
}

class _UpdateProfileViewState extends UpdateProfileViewModel {
  TextEditingController usernameTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
              color: Colors.yellow,
            ))
          : Form(
              key: _formkey,
              child: SingleChildScrollView(
                child: Container(
                  padding: context.paddingMedium,
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          _circleImage(context),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: _editImageButton(context),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: context.highHeightValue,
                      ),
                      Form(
                          child: Column(
                        children: [
                          _usernameTextForm(),
                          SizedBox(
                            height: context.normalHeightValue,
                          ),
                          _phoneTextForm(),
                          SizedBox(
                            height: context.normalHeightValue,
                          ),
                          _passwordTextForm(),
                          SizedBox(
                            height: context.normalHeightValue,
                          ),
                          _editProfileButton(context),
                          _deleteButton(context),
                        ],
                      ))
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Row _deleteButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
            onPressed: () {},
            child: Text(
              LanguageItems.delete,
              style: context.textTheme.labelMedium?.copyWith(color: Colors.red),
            )),
      ],
    );
  }

  SizedBox _editProfileButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
          onPressed: () {
            if (_formkey.currentState?.validate() ?? false) {
              update(
                  usernameTextEditingController.text,
                  phoneTextEditingController.text,
                  passwordTextEditingController.text);
            }
          },
          child: Text(
            LanguageItems.editProfile,
            style: context.textTheme.labelLarge?.copyWith(color: Colors.black),
          )),
    );
  }

  TextFormField _passwordTextForm() {
    return TextFormField(
      obscureText: true,
      validator: (value) {
        if (value != null && value.isEmpty) {
          return LanguageItems.enterPassword;
        }
        return null;
      },
      controller: passwordTextEditingController,
      decoration: const InputDecoration(
          label: Text(LanguageItems.enterPassword),
          prefixIcon: Icon(Icons.lock)),
    );
  }

  TextFormField _phoneTextForm() {
    return TextFormField(
      validator: (value) {
        if (value != null && value.isEmpty) {
          return LanguageItems.enterPhone;
        }
        return null;
      },
      controller: phoneTextEditingController,
      decoration: const InputDecoration(
          label: Text(LanguageItems.enterPhone), prefixIcon: Icon(Icons.phone)),
    );
  }

  TextFormField _usernameTextForm() {
    return TextFormField(
      validator: (value) {
        if (value != null && value.isEmpty) {
          return LanguageItems.enterUsername;
        }
        return null;
      },
      controller: usernameTextEditingController,
      decoration: const InputDecoration(
          label: Text("Username"), prefixIcon: Icon(Icons.person_outline)),
    );
  }

  Container _editImageButton(BuildContext context) {
    return Container(
      width: context.height * 0.04,
      height: context.height * 0.04,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100), color: Colors.yellow),
      child: const Icon(
        LineAwesomeIcons.camera,
        color: Colors.black,
      ),
    );
  }

  SizedBox _circleImage(BuildContext context) {
    return SizedBox(
      width: context.height * 0.15,
      height: context.height * 0.15,
      child: const CircleAvatar(
        backgroundImage: AssetImage(AssetConstants.pizzaImage),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text(LanguageItems.editProfile),
      leading: IconButton(
        icon: const Icon(LineAwesomeIcons.angle_left),
        onPressed: () {
          context.router.pop();
        },
      ),
    );
  }
}
