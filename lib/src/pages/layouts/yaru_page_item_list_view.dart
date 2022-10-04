import 'package:flutter/material.dart';

import '../../../yaru_widgets.dart';
import '../../constants.dart';

const double _kScrollbarThickness = 8.0;
const double _kScrollbarMargin = 2.0;

class YaruPageItemListView extends StatelessWidget {
  const YaruPageItemListView({
    super.key,
    required this.pages,
    required this.selectedIndex,
    required this.onTap,
    this.materialTiles = false,
  });

  final List<YaruPageItem> pages;
  final int selectedIndex;
  final Function(int index) onTap;
  final bool materialTiles;

  @override
  Widget build(BuildContext context) {
    final scrollbarThicknessWithTrack =
        _calcScrollbarThicknessWithTrack(context);

    return ListView.separated(
      separatorBuilder: (_, __) => const SizedBox(height: 6.0),
      padding: !materialTiles
          ? EdgeInsets.symmetric(
              horizontal: scrollbarThicknessWithTrack,
              vertical: 8.0,
            )
          : null,
      controller: ScrollController(),
      itemCount: pages.length,
      itemBuilder: (context, index) => materialTiles
          ? ListTile(
              visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
              selected: index == selectedIndex,
              title: pages[index].titleBuilder(context),
              leading: Icon(pages[index].iconData),
              onTap: () => onTap(index),
            )
          : _YaruListTile(
              selected: index == selectedIndex,
              title: pages[index].titleBuilder(context),
              iconData: pages[index].iconData,
              onTap: () => onTap(index),
            ),
    );
  }

  double _calcScrollbarThicknessWithTrack(final BuildContext context) {
    final scrollbarTheme = Theme.of(context).scrollbarTheme;

    final doubleMarginWidth = scrollbarTheme.crossAxisMargin != null
        ? scrollbarTheme.crossAxisMargin! * 2
        : _kScrollbarMargin * 2;

    final scrollBarThumbThikness =
        scrollbarTheme.thickness?.resolve({MaterialState.hovered}) ??
            _kScrollbarThickness;

    return doubleMarginWidth + scrollBarThumbThikness;
  }
}

class _YaruListTile extends StatelessWidget {
  const _YaruListTile({
    required this.selected,
    this.iconData,
    required this.onTap,
    required this.title,
  });

  final bool selected;
  final IconData? iconData;
  final Function() onTap;
  final Widget? title;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius:
            const BorderRadius.all(Radius.circular(kDefaultButtonRadius)),
        color: selected
            ? Theme.of(context).colorScheme.onSurface.withOpacity(0.07)
            : null,
      ),
      child: ListTile(
        textColor: Theme.of(context).colorScheme.onSurface,
        selectedColor: Theme.of(context).colorScheme.onSurface,
        visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(kDefaultButtonRadius)),
        ),
        leading: iconData != null
            ? Icon(
                iconData,
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
              )
            : null,
        title: _buildTitle(),
        selected: selected,
        onTap: onTap,
      ),
    );
  }

  Widget? _buildTitle() {
    if (title == null) {
      return title;
    }

    if (title is YaruPageItemTitle) {
      return DefaultTextStyle.merge(
        child: title!,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );
    }

    return title;
  }
}
