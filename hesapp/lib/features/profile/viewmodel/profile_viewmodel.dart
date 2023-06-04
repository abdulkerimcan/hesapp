import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hesapp/core/init/navigator/app_router.dart';
import 'package:hesapp/features/profile/model/profile_section_model.dart';

class ProfileViewModel extends ChangeNotifier {
  List<ProfileSectionModel> sectionsList = [];

  void addItems() {
    sectionsList.addAll([
      ProfileSectionModel(
          page: const HomepageViewRoute(),
          title: "Account Information",
          icon: const Icon(Icons.person_2_outlined)),
      ProfileSectionModel(
          page: const HomepageViewRoute(),
          title: "Order New Debit Card",
          icon: const Icon(Icons.credit_card_outlined)),
      ProfileSectionModel(
          page: const HomepageViewRoute(),
          title: "Past Orders",
          icon: const Icon(Icons.shopping_bag_outlined)),
      ProfileSectionModel(
          page: const HomepageViewRoute(),
          title: "Change Password",
          icon: const Icon(Icons.key)),
      ProfileSectionModel(
          page: const HomepageViewRoute(),
          title: "Logout",
          icon: const Icon(Icons.logout_outlined)),
    ]);
  }
}
