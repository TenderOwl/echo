import 'package:flutter/material.dart';

import '../components/app_header.dart';
import '../components/app_view.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext, BoxConstraints) {
        return Scaffold(
          body: SafeArea(
            child: Column(children: [
              AppHeader(),
              AppView(),
            ]),
          ),
        );
      },
    );
  }
}
