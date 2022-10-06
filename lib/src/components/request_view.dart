import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
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
    return DefaultTabController(
      length: 4,
      child: Column(
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
                  selectedItemBuilder: (context) => requestMethods
                      .map((e) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(e['name']!),
                          ))
                      .toList(),
                  items: requestMethods
                      .map((e) => DropdownMenuItem<String>(
                            value: e['value'],
                            child: Text(e['name']!),
                          ))
                      .toList(),
                  onChanged: (value) => setState(() {
                    selectedMethod = value;
                  }),
                  isDense: true,
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
                  height: 36,
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
          const TabBar(
            padding: EdgeInsets.zero,
            tabs: [
              Tab(
                child: Text('Body', overflow: TextOverflow.ellipsis),
              ),
              Tab(
                child: Text('Auth', overflow: TextOverflow.ellipsis),
              ),
              Tab(
                child: Text('Query', overflow: TextOverflow.ellipsis),
              ),
              Tab(
                child: Text('Headers', overflow: TextOverflow.ellipsis),
              ),
            ],
          ),
          const Expanded(
            child: TabBarView(
              children: [
                Icon(LineIcons.paragraph),
                Icon(LineIcons.lockOpen),
                Icon(LineIcons.link),
                Icon(LineIcons.alternateList),
              ],
            ),
          )
        ],
      ),
    );
  }

  void sendRequest() {
    print('Sending request: $selectedMethod ${urlController.text}');
  }
}
