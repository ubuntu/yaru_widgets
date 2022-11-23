import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Defines default property values for descendant [ToggleButton] widgets.
///
/// Descendant widgets obtain the current [YaruToggleButtonThemeData] object
/// using `YaruToggleButtonTheme.of(context)`. Instances of [YaruToggleButtonThemeData]
/// can be customized with [YaruToggleButtonThemeData.copyWith].
@immutable
class YaruToggleButtonThemeData with Diagnosticable {
  /// Creates a theme that can be used for [YaruToggleButtonTheme.data].
  const YaruToggleButtonThemeData({
    this.horizontalSpacing,
    this.verticalSpacing,
    this.titleStyle,
    this.subtitleStyle,
  });

  /// The spacing between the indicator and the title.
  final double? horizontalSpacing;

  /// The spacing between the title and the subtitle.
  final double? verticalSpacing;

  /// The style of the title text.
  final TextStyle? titleStyle;

  /// The style of the subtitle text.
  final TextStyle? subtitleStyle;

  /// Creates a copy with the given fields replaced with new values.
  YaruToggleButtonThemeData copyWith({
    double? horizontalSpacing,
    double? verticalSpacing,
    TextStyle? titleStyle,
    TextStyle? subtitleStyle,
  }) {
    return YaruToggleButtonThemeData(
      horizontalSpacing: horizontalSpacing ?? this.horizontalSpacing,
      verticalSpacing: verticalSpacing ?? this.verticalSpacing,
      titleStyle: titleStyle ?? this.titleStyle,
      subtitleStyle: subtitleStyle ?? this.subtitleStyle,
    );
  }

  @override
  int get hashCode {
    return Object.hash(
      horizontalSpacing,
      verticalSpacing,
      titleStyle,
      subtitleStyle,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is YaruToggleButtonThemeData &&
        other.horizontalSpacing == horizontalSpacing &&
        other.verticalSpacing == verticalSpacing &&
        other.titleStyle == titleStyle &&
        other.subtitleStyle == subtitleStyle;
  }
}

/// Applies a theme to descendant [ToggleButton] widgets.
///
/// Descendant widgets obtain the current [YaruToggleButtonTheme] object using
/// [YaruToggleButtonTheme.of]. When a widget uses [YaruToggleButtonTheme.of],
/// it is automatically rebuilt if the theme later changes.
///
/// See also:
///
///  * [YaruToggleButtonThemeData], which describes the actual configuration of
///    a toggle button theme.
class YaruToggleButtonTheme extends InheritedWidget {
  /// Constructs a checkbox theme that configures all descendant [ToggleButton]
  /// widgets.
  const YaruToggleButtonTheme({
    super.key,
    required this.data,
    required super.child,
  });

  /// The properties used for all descendant [ToggleButton] widgets.
  final YaruToggleButtonThemeData data;

  /// Returns the configuration [data] from the closest [YaruToggleButtonTheme]
  /// ancestor. If there is no ancestor, it returns `null`.
  static YaruToggleButtonThemeData? of(BuildContext context) {
    final t =
        context.dependOnInheritedWidgetOfExactType<YaruToggleButtonTheme>();
    return t?.data;
  }

  @override
  bool updateShouldNotify(YaruToggleButtonTheme oldWidget) {
    return data != oldWidget.data;
  }
}
