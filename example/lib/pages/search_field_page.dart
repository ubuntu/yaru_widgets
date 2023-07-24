import 'package:flutter/material.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

class SearchFieldPage extends StatefulWidget {
  const SearchFieldPage({super.key});

  @override
  State<SearchFieldPage> createState() => _SearchFieldPageState();
}

class _SearchFieldPageState extends State<SearchFieldPage> {
  var _titleSearchActive = false;
  var _fieldSearchActive = false;

  String _titleText = 'YaruSearchFieldTitle';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final light = theme.brightness == Brightness.light;

    return Center(
      child: ListView(
        children: [
          SimpleDialog(
            shadowColor: light ? Colors.black : null,
            titlePadding: EdgeInsets.zero,
            title: YaruDialogTitleBar(
              titleSpacing: 0,
              centerTitle: true,
              title: YaruSearchFieldTitle(
                text: _titleText,
                onClear: () => setState(() => _titleText = ''),
                onSubmitted: (value) =>
                    setState(() => _titleText = value ?? ''),
                searchActive: _titleSearchActive,
                onSearchActive: () =>
                    setState(() => _titleSearchActive = !_titleSearchActive),
                title: Text(
                  _titleText,
                ),
              ),
            ),
            children: const [
              SizedBox(
                height: 300,
                width: 450,
              )
            ],
          ),
          SimpleDialog(
            shadowColor: light ? Colors.black : null,
            titlePadding: EdgeInsets.zero,
            title: YaruDialogTitleBar(
              heroTag: 'bar2',
              titleSpacing: 0,
              centerTitle: true,
              title: _fieldSearchActive
                  ? YaruSearchField(
                      onClear: () {},
                    )
                  : const Text('Title'),
              leading: YaruSearchButton(
                searchActive: _fieldSearchActive,
                onPressed: () =>
                    setState(() => _fieldSearchActive = !_fieldSearchActive),
              ),
            ),
            children: const [
              SizedBox(
                height: 300,
                width: 450,
              )
            ],
          ),
        ],
      ),
    );
  }
}
