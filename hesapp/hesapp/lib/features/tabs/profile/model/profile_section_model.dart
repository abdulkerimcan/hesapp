import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class ProfileSectionModel {
  final String title;
  final Icon icon;
  final PageRouteInfo page;

  ProfileSectionModel({required this.page, required this.title, required this.icon});
}
