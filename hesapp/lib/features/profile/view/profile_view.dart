import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hesapp/core/extension/contex_extension.dart';
import 'package:hesapp/core/init/navigator/app_router.dart';
import 'package:hesapp/features/profile/viewmodel/profile_viewmodel.dart';
import 'package:hesapp/features/profile/widget/profile_menu.dart';
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
    context.read<ProfileViewModel>().addItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: context.paddingMedium,
          child: Column(
            children: [
              InkWell(onTap: () => print("object"), child: _buildImage()),
              const SizedBox(
                height: 10,
              ),
              Text(
                "User name",
                style: context.textTheme.labelLarge,
              ),
              Text(
                "user@email.com",
                style: context.textTheme.bodyLarge,
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                  width: context.width * 0.5,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow,
                        side: BorderSide.none,
                        shape: const StadiumBorder()),
                    onPressed: () {
                      context.router.push(const UpdateProfileViewRoute());
                    },
                    child: const Text(
                      "Edit Profile",
                      style: TextStyle(color: Colors.black),
                    ),
                  )),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                thickness: 1,
              ),

              //menu
              ProfileMenuWidget(
                title: "Account Information",
                iconData: LineAwesomeIcons.user_check,
                onPress: () {},
              ),
              ProfileMenuWidget(
                title: "Past Orders",
                iconData: LineAwesomeIcons.shopping_basket,
                onPress: () {},
              ),
              ProfileMenuWidget(
                title: "Add New Card",
                iconData: LineAwesomeIcons.credit_card,
                onPress: () {},
              ),
              ProfileMenuWidget(
                title: "Change Password",
                iconData: LineAwesomeIcons.key,
                onPress: () {},
              ),
              ProfileMenuWidget(
                title: "Logout",
                iconData: Icons.logout_outlined,
                onPress: () {},
              ),
            ],
          ),
        ),
      ),
      // body: Column(
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     Padding(
      //       padding: context.paddingLow,
      //       child: Text(
      //         "Account",
      //         style: context.textTheme.labelLarge,
      //       ),
      //     ),
      //     Expanded(
      //         child: ListView.builder(
      //       itemCount: context.read<ProfileViewModel>().sectionsList.length,
      //       itemBuilder: (context, index) {
      //         final list = context.read<ProfileViewModel>().sectionsList;
      //         return ListTile(
      //           onTap: () {
      //             //navigate
      //             context.router.push(list[index].page);
      //           },
      //           title: Text(list[index].title),
      //           leading: list[index].icon,
      //           trailing: const Icon(Icons.keyboard_arrow_right_outlined),
      //         );
      //       },
      //     ))
      //   ],
      // ),
    );
  }

  Stack _buildImage() {
    return Stack(
      children: [
        const SizedBox(
          width: 120,
          height: 120,
          child: CircleAvatar(
            backgroundImage: AssetImage("assets/images/pizza.jpeg"),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100), color: Colors.yellow),
            child: const Icon(
              LineAwesomeIcons.alternate_pencil,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
