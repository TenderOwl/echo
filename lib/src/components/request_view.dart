import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class RequestView extends StatefulWidget {
  const RequestView({super.key});

  @override
  State<RequestView> createState() => RequestViewState();
}

class RequestViewState extends State<RequestView> {
  final requestMethods = [
    {'name': 'GET', 'value': 'GET'},
    {'name': 'POST', 'value': 'POST'},
    {'name': 'PUT', 'value': 'PUT'},
    {'name': 'PATCH', 'value': 'PATCH'},
    {'name': 'DELETE', 'value': 'DELETE'},
    {'name': 'OPTIONS', 'value': 'OPTIONS'},
    {'name': 'HEAD', 'value': 'HEAD'},
    {'name': 'Custom', 'value': null},
  ];

  TextEditingController urlController = TextEditingController();

  String? selectedMethod;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 1, color: Colors.grey),
            ),
          ),
          child: Row(
            children: [
              DropdownButton<String>(
                value: selectedMethod,
                items: requestMethods
                    .map((e) => DropdownMenuItem<String>(
                          value: e['value'],
                          child: Text(e['name']!),
                        ))
                    .toList(),
                onChanged: (value) => setState(() {
                  selectedMethod = value;
                }),
                underline: Container(),
              ),
              Expanded(
                child: TextField(
                  controller: urlController,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 8),
                    isDense: true,
                    border: InputBorder.none,
                    hintText: 'https://api.example.com/v1/users',
                  ),
                  onSubmitted: (_) => sendRequest(),
                ),
              ),
              SizedBox(
                width: 90,
                height: 46,
                child: MaterialButton(
                  onPressed: sendRequest,
                  color: Theme.of(context).primaryColor,
                  elevation: 0,
                  hoverElevation: 0,
                  child: const Text('Send'),
                ),
              )
            ],
          ),
        ),
        const Expanded(
          child: Center(child: Text('Request settings')),
        )
      ],
    );
  }

  void sendRequest() {
    print('Sending request: $selectedMethod ${urlController.text}');
  }
}
