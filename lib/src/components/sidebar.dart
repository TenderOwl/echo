import 'dart:math';

import 'package:echo/src/models/endpoint.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class SidebarView extends StatefulWidget {
  const SidebarView({super.key});

  @override
  State<SidebarView> createState() => _SidebarViewState();
}

class _SidebarViewState extends State<SidebarView> {
  List<Endpoint> endpoints = [];
  Random rnd = Random();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 36,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6)),
                      hintText: 'Filter',
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 4),
              IconButton(
                icon: const Icon(LineIcons.plusCircle),
                onPressed: () => addEndpoint(),
              )
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: endpoints.length,
            itemBuilder: (context, index) {
              final item = endpoints[index];
              return SizedBox(
                height: 36,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: MaterialButton(
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
                    child: Row(
                      children: [
                        Text(
                          item.method,
                          style: TextStyle(
                              color: getMethodColor(item.method),
                              fontWeight: FontWeight.normal),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          item.title,
                          style: const TextStyle(fontWeight: FontWeight.normal),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void addEndpoint({String title = 'new request'}) {
    final methods = [
      'GET',
      'POST',
      'PATCH',
      'PUT',
      'DELETE',
      'HEAD',
      'OPTIONS'
    ];
    final method = methods[rnd.nextInt(methods.length)];

    setState(() {
      endpoints.add(Endpoint(title, method: method));
    });
  }

  Color getMethodColor(String method) {
    switch (method.toUpperCase()) {
      case 'GET':
        return Colors.green;
      case 'POST':
        return Colors.blue;
      case 'PATCH':
        return Colors.purple;
      case 'PUT':
        return Colors.amber;
      case 'DELETE':
        return Colors.red;
      case 'HEAD':
      case 'OPTIONS':
        return Colors.blueGrey;
      default:
        return Theme.of(context).colorScheme.onSurface;
    }
  }
}
