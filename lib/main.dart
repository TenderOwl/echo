import 'package:echo/src/app_theme.dart';
import 'package:echo/src/layouts/app_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'src/services/storage.dart';

void main() async {
  await initServices();
  runApp(const MyApp());
}

Future<void> initServices() async {
  await Get.putAsync(() => EndpointsService().init());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Echo',
      theme: appThemeData,
      debugShowCheckedModeBanner: false,
      home: const AppLayout(),
    );
  }
}
