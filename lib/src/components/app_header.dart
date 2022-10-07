import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 48,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
              width: 1, color: Theme.of(context).colorScheme.outline),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(LineIcons.satelliteDish,
                    color: Theme.of(context).colorScheme.primary),
                SizedBox(width: 8),
                TextButton(
                  onPressed: () {},
                  child: Text('New project'),
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(LineIcons.cog),
                  visualDensity: VisualDensity.compact,
                  padding: EdgeInsets.zero,
                  splashRadius: 16,
                ),
                SizedBox(width: 8),
                IconButton(
                  onPressed: () {},
                  icon: Icon(LineIcons.userCog),
                  visualDensity: VisualDensity.compact,
                  padding: EdgeInsets.zero,
                  splashRadius: 16,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
