import 'package:flutter/material.dart';
import 'package:hesapp/features/tabs/tab_view.dart';
import 'package:hesapp/product/model/user_model.dart';
import 'package:hesapp/core/theme/app_theme.dart';
import 'package:hesapp/features/home/viewmodel/selected_card_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => User()),
    ChangeNotifierProvider(create: (context) => SelectedIndexProvider())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.darkTheme,
      home: const TabView(),
    );
  }
}
