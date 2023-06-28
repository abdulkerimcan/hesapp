import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hesapp/core/constants/app_routes.dart';
import 'package:hesapp/core/constants/asset_constants.dart';
import 'package:hesapp/core/constants/language_items.dart';
import 'package:hesapp/core/extension/contex_extension.dart';
import 'package:hesapp/core/init/cache/local_manager.dart';
import 'package:hesapp/core/init/data/viewmodel/user_provider.dart';
import 'package:hesapp/features/tabs/profile/widget/profile_menu.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:provider/provider.dart';

@RoutePage()
class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: context.paddingMedium,
          child: Column(
            children: [
              InkWell(onTap: () {}, child: _buildImage()),
              SizedBox(
                height: context.lowHeightValue,
              ),
              _usernameText(context),
              _emailText(context),
              SizedBox(
                height: context.normalHeightValue,
              ),
              SizedBox(
                  width: context.width * 0.5,
                  child: _editProfileButton(context)),
              SizedBox(
                height: context.normalHeightValue,
              ),
              _divider(),

              //menu
              ProfileMenuWidget(
                title: LanguageItems.accountInformation,
                iconData: LineAwesomeIcons.user_check,
                onPress: () {},
              ),
              ProfileMenuWidget(
                title: LanguageItems.pastOrders,
                iconData: LineAwesomeIcons.shopping_basket,
                onPress: () {},
              ),
              ProfileMenuWidget(
                title: LanguageItems.addNewCard,
                iconData: LineAwesomeIcons.credit_card,
                onPress: () {},
              ),
              ProfileMenuWidget(
                title: LanguageItems.changePassword,
                iconData: LineAwesomeIcons.key,
                onPress: () {},
              ),
              ProfileMenuWidget(
                title: LanguageItems.logout,
                iconData: Icons.logout_outlined,
                onPress: () {
                  LocalManager.instance.clearAllSaveFirst().whenComplete(() => context.router.replaceNamed(AppRoutes.routeAuthMain));

                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  ElevatedButton _editProfileButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.router.pushNamed(AppRoutes.routeEditMain);
      },
      child: _editProfileText(),
    );
  }

  Divider _divider() {
    return const Divider(
      thickness: 1,
    );
  }

  Text _editProfileText() {
    return const Text(
      LanguageItems.editProfile,
      style: TextStyle(color: Colors.black),
    );
  }

  Text _emailText(BuildContext context) {
    return Text(
      context.watch<UserProvider>().email,
      style: context.textTheme.bodyLarge,
    );
  }

  Text _usernameText(BuildContext context) {
    return Text(
      context.watch<UserProvider>().username,
      style: context.textTheme.labelLarge,
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text(LanguageItems.profile),
    );
  }

  Stack _buildImage() {
    return Stack(
      children: [
        _circleAvatar(),
        _editImageButton(),
      ],
    );
  }

  Positioned _editImageButton() {
    return Positioned(
      bottom: 0,
      right: 0,
      child: Container(
        width: context.height * 0.04,
        height: context.height * 0.04,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100), color: Colors.yellow),
        child: const Icon(
          LineAwesomeIcons.alternate_pencil,
          color: Colors.black,
        ),
      ),
    );
  }

  SizedBox _circleAvatar() {
    return SizedBox(
      width: context.highHeightValue,
      height: context.highHeightValue,
      child: const CircleAvatar(
        backgroundImage: AssetImage(AssetConstants.pizzaImage),
      ),
    );
  }
}
