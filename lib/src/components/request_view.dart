import 'package:flutter/material.dart';

class RequestView extends StatefulWidget {
  const RequestView({super.key});

  @override
  State<RequestView> createState() => RequestViewState();
}

class RequestViewState extends State<RequestView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      color: Colors.blueGrey,
    );
  }
}
