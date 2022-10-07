import 'package:flutter/material.dart';

class ResponseView extends StatefulWidget {
  const ResponseView({super.key});

  @override
  State<ResponseView> createState() => ResponseViewState();
}

class ResponseViewState extends State<ResponseView> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Response'),
    );
  }
}
