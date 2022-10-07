import 'package:flutter/material.dart';

class SidebarView extends StatefulWidget {
  const SidebarView({super.key});

  @override
  State<SidebarView> createState() => _SidebarViewState();
}

class _SidebarViewState extends State<SidebarView> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Sidebar'),
    );
  }
}
