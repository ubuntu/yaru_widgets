import 'package:flutter/material.dart';
import 'package:yaru_colors/yaru_colors.dart';
import 'package:yaru/src/themes/common_themes.dart';

const _primaryColor = YaruColors.ubuntuStudioBlue;

final _lightColorScheme = ColorScheme.fromSwatch(
  primarySwatch: _primaryColor,
  primaryColorDark: YaruColors.coolGrey,
  accentColor: _primaryColor,
  cardColor: Colors.white,
  backgroundColor: YaruColors.porcelain,
  errorColor: YaruColors.error,
  brightness: Brightness.light,
);

final yaruUbuntuStudioLight = createYaruLightTheme(
  colorScheme: _lightColorScheme,
  primaryColor: _primaryColor,
);

final _darkColorScheme = ColorScheme.fromSwatch(
  primarySwatch: _primaryColor,
  primaryColorDark: YaruColors.coolGrey,
  accentColor: _primaryColor,
  cardColor: YaruColors.jet,
  backgroundColor: YaruColors.jet,
  errorColor: YaruColors.error,
  brightness: Brightness.dark,
);

final yaruUbuntuStudioDark = createYaruDarkTheme(
  colorScheme: _darkColorScheme,
  primaryColor: _primaryColor,
);
