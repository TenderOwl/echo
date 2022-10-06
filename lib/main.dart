import 'package:echo/src/layouts/app_layout.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          textTheme: GoogleFonts.ibmPlexSansTextTheme(),
          // primaryColor: Color.fromARGB(255, 20, 84, 104),
          colorScheme: ColorScheme.dark(),
        ),
        debugShowCheckedModeBanner: false,
        home: const AppLayout());
  }
}
