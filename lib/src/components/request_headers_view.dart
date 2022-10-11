import 'package:echo/src/components/header_editing_row.dart';
import 'package:flutter/material.dart';

class RequestHeadersView extends StatefulWidget {
  const RequestHeadersView({super.key});

  @override
  State<RequestHeadersView> createState() => _RequestHeadersViewState();
}

class _RequestHeadersViewState extends State<RequestHeadersView> {
  final headers = <Map<String, String>>[];
  final disabledHeaders = <Map<String, String>>[];

  @override
  void initState() {
    super.initState();

    headers.add({'': ''});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: headers.length + 1,
              itemBuilder: (context, index) {
                if (index == headers.length) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                        onPressed: addHeader,
                        child: const Text(
                          'Add header',
                          style: TextStyle(fontWeight: FontWeight.w400),
                        )),
                  );
                } else {
                  return HeaderEditingRow(
                    index: index,
                    header: headers[index],
                    onToggle: toggleHeader,
                    onRemove: index > 0 ? removeHeader : null,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  void addHeader() {
    setState(() {
      headers.add({'': ''});
    });
  }

  void toggleHeader(int index, bool state) {
    setState(() {
      state
          ? disabledHeaders.add(headers[index])
          : disabledHeaders.remove(headers[index]);
    });
  }

  void removeHeader(int index) {
    setState(() {
      headers.removeAt(index);
    });
  }
}
