import 'package:echo/src/components/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:multi_split_view/multi_split_view.dart';

import 'request_view.dart';
import 'response_view.dart';

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MultiSplitView(
        children: [
          SidebarView(),
          RequestView(),
          ResponseView(),
        ],
      ),
    );
  }
}
