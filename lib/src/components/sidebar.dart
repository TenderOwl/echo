import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import '../models/endpoint.dart';
import '../models/endpoints_collection.dart';
import '../services/endpoints_service.dart';

class SidebarView extends StatefulWidget {
  const SidebarView({super.key});

  @override
  State<SidebarView> createState() => _SidebarViewState();
}

class _SidebarViewState extends State<SidebarView> {
  List<EndpointsCollection>? endpointsCollections;
  Random rnd = Random();

  EndpointsService endpointsService = Get.find();

  @override
  void initState() {
    super.initState();
    loadCollections();
  }

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
            itemCount: endpointsCollections?.length ?? 0,
            itemBuilder: (context, index) {
              final item = endpointsCollections?[index];
              return SizedBox(
                height: 36,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: MaterialButton(
                    onPressed: () {
                      endpointsService.currentCollection = item;
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
                    child: Row(
                      children: [
                        // Text(
                        //   item.method,
                        //   style: TextStyle(
                        //       color: getMethodColor(item.method),
                        //       fontWeight: FontWeight.normal),
                        // ),
                        // const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            item?.name ?? '--',
                            overflow: TextOverflow.fade,
                            softWrap: false,
                            style:
                                const TextStyle(fontWeight: FontWeight.normal),
                          ),
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

  void addEndpoint({String title = 'new request'}) async {
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

    await endpointsService
        .addCollection(EndpointsCollection()..name = 'New Collection');

    loadCollections();
  }

  void loadCollections() {
    setState(() {
      endpointsCollections = endpointsService.getCollections();
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
