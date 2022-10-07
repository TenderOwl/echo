import 'package:echo/src/components/request_headers_view.dart';
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
    return DefaultTabController(
      length: 4,
      child: Column(
        children: [
          Container(
            height: 36,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  color: Theme.of(context).colorScheme.outline,
                ),
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
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.zero),
                    ),
                    onPressed: sendRequest,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Text('Send'),
                        Icon(LineIcons.paperPlane),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 36,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                    width: 1, color: Theme.of(context).colorScheme.outline),
              ),
            ),
            child: TabBar(
              indicator: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              tabs: const [
                Tab(
                  child: Text('Body',
                      style: TextStyle(fontSize: 14),
                      overflow: TextOverflow.ellipsis),
                ),
                Tab(
                  child: Text('Auth',
                      style: TextStyle(fontSize: 14),
                      overflow: TextOverflow.ellipsis),
                ),
                Tab(
                  child: Text('Query',
                      style: TextStyle(fontSize: 14),
                      overflow: TextOverflow.ellipsis),
                ),
                Tab(
                  child: Text('Headers',
                      style: TextStyle(fontSize: 14),
                      overflow: TextOverflow.ellipsis),
                ),
              ],
            ),
          ),
          const Expanded(
            child: TabBarView(
              children: [
                Icon(LineIcons.paragraph),
                Icon(LineIcons.lockOpen),
                Icon(LineIcons.link),
                RequestHeadersView(),
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
