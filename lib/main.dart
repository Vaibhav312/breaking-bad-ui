import 'package:demoproject/presentation/screens/home_page.dart';
import 'package:demoproject/provider_stores/homescreen_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

void main() {
  List<SingleChildWidget> providers = [
    ChangeNotifierProvider<HomeScreenProvider>(
        create: (_) => HomeScreenProvider()),
  ];
  runApp(MultiProvider(providers: providers, child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
