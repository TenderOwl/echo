import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class HeaderEditingRow extends StatefulWidget {
  final int index;
  final Map<String, String> header;
  final VoidCallback onAdd;
  final void Function(int, bool) onToggle;
  final void Function(int) onRemove;

  const HeaderEditingRow({
    super.key,
    required this.index,
    required this.header,
    required this.onAdd,
    required this.onToggle,
    required this.onRemove,
  });

  @override
  State<HeaderEditingRow> createState() => _HeaderEditingRowState();
}

class _HeaderEditingRowState extends State<HeaderEditingRow> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController valueController = TextEditingController();

  bool enabledState = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
      child: SizedBox(
        height: 32,
        child: Row(
          children: [
            IconButton(
              onPressed: widget.onAdd,
              icon: const Icon(LineIcons.plusCircle, size: 16),
              padding: EdgeInsets.zero,
              visualDensity: VisualDensity.compact,
              splashRadius: 12,
            ),
            Expanded(
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(8),
                  isDense: true,
                  border: InputBorder.none,
                  filled: true,
                  hintText: 'New header',
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: TextField(
                controller: valueController,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(8),
                  isDense: true,
                  border: InputBorder.none,
                  filled: true,
                  hintText: 'New value',
                ),
              ),
            ),
            const SizedBox(width: 8),
            Checkbox(
              value: enabledState,
              onChanged: (value) {
                setState(() {
                  enabledState = !value!;
                });
                widget.onToggle(widget.index, enabledState);
              },
              visualDensity: VisualDensity.compact,
              splashRadius: 12,
            ),
            IconButton(
              onPressed: () => widget.onRemove(widget.index),
              icon: const Icon(LineIcons.trash, size: 16),
              padding: EdgeInsets.zero,
              visualDensity: VisualDensity.compact,
              splashRadius: 12,
            ),
          ],
        ),
      ),
    );
  }
}
