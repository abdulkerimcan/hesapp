import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hesapp/core/extension/contex_extension.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

@RoutePage()
class UpdateProfileView extends StatelessWidget {
  const UpdateProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Title"),
        leading: IconButton(
          icon: const Icon(LineAwesomeIcons.angle_left),
          onPressed: () {
            context.router.pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: context.paddingMedium,
          child: Column(
            children: [
              Stack(
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
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.yellow),
                      child: const Icon(
                        LineAwesomeIcons.camera,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Form(
                  child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                        label: Text("Full Name"),
                        prefixIcon: Icon(Icons.person_outline)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        label: Text("Username"),
                        prefixIcon: Icon(Icons.person_outline)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        label: Text("E-mail"), prefixIcon: Icon(Icons.email)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        label: Text("Phone"), prefixIcon: Icon(Icons.phone)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.yellow),
                        onPressed: () {},
                        child: Text(
                          "Edit Profile",
                          style: context.textTheme.labelLarge
                              ?.copyWith(color: Colors.black),
                        )),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "Delete",
                            style: context.textTheme.labelMedium
                                ?.copyWith(color: Colors.red),
                          )),
                    ],
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
