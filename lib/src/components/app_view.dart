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
  final splitViewController = MultiSplitViewController(areas: [
    Area(minimalSize: 150, weight: 0.2),
    Area(weight: .40),
    Area(weight: .40)
  ]);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MultiSplitViewTheme(
        data: MultiSplitViewThemeData(
            dividerThickness: 3,
            dividerPainter: DividerPainters.grooved1(
              thickness: 2,
              highlightedThickness: 3,
              backgroundColor: Color(0xfff1f1f1),
            )),
        child: MultiSplitView(
          controller: splitViewController,
          children: [
            SidebarView(),
            RequestView(),
            ResponseView(),
          ],
        ),
      ),
    );
  }
}
