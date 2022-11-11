import 'package:flutter/material.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

class WindowControlsPage extends StatefulWidget {
  const WindowControlsPage({super.key});

  @override
  State<WindowControlsPage> createState() => _WindowControlsPageState();
}

class _WindowControlsPageState extends State<WindowControlsPage> {
  bool _maximized = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(kYaruPagePadding),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            YaruWindowControl(
              type: YaruWindowControlType.minimize,
              onTap: () {},
            ),
            const SizedBox(width: 10),
            YaruWindowControl(
              type: _maximized
                  ? YaruWindowControlType.maximize
                  : YaruWindowControlType.restore,
              onTap: () => setState(() => _maximized = !_maximized),
            ),
            const SizedBox(width: 10),
            YaruWindowControl(
              type: YaruWindowControlType.close,
              onTap: () {},
            ),
          ],
        ),
        YaruTile(
          title: const Text('Maximized'),
          trailing: YaruSwitch(
            value: _maximized,
            onChanged: (v) => setState(() => _maximized = v),
          ),
        ),
      ],
    );
  }
}
