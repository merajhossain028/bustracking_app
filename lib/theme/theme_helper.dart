import 'package:flutter/material.dart';
import '../../core/app_export.dart';

/// Helper class for managing themes and colors.
class ThemeHelper {
  // The current app theme
  var _appTheme = PrefUtils().getThemeData();

// A map of custom color themes supported by the app
  Map<String, PrimaryColors> _supportedCustomColor = {
    'primary': PrimaryColors()
  };

// A map of color schemes supported by the app
  Map<String, ColorScheme> _supportedColorScheme = {
    'primary': ColorSchemes.primaryColorScheme
  };

  /// Changes the app theme to [_newTheme].
  void changeTheme(String _newTheme) {
    PrefUtils().setThemeData(_newTheme);
    Get.forceAppUpdate();
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors _getThemeColors() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedCustomColor.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    return _supportedCustomColor[_appTheme] ?? PrimaryColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    //throw exception to notify given theme is not found or not generated by the generator
    if (!_supportedColorScheme.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }
    //return theme from map

    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.primaryColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              14,
            ),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: Color(0XFFFFFFFF),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: appTheme.black900,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(
              14,
            ),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return colorScheme.primary;
          }
          return colorScheme.onSurface;
        }),
        visualDensity: const VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return colorScheme.primary;
          }
          return colorScheme.onSurface;
        }),
        side: BorderSide(
          width: 1,
        ),
        visualDensity: const VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
      ),
      dividerTheme: DividerThemeData(
        thickness: 1,
        space: 1,
        color: colorScheme.onPrimaryContainer,
      ),
    );
  }

  /// Returns the primary colors for the current theme.
  PrimaryColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyLarge: TextStyle(
          color: appTheme.black900,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'Archivo',
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: colorScheme.errorContainer,
          fontSize: getFontSize(
            13,
          ),
          fontFamily: 'Archivo',
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: appTheme.black900,
          fontSize: getFontSize(
            12,
          ),
          fontFamily: 'Archivo',
          fontWeight: FontWeight.w400,
        ),
        displaySmall: TextStyle(
          color: appTheme.black900,
          fontSize: getFontSize(
            34,
          ),
          fontFamily: 'Archivo',
          fontWeight: FontWeight.w700,
        ),
        headlineMedium: TextStyle(
          color: appTheme.black900,
          fontSize: getFontSize(
            28,
          ),
          fontFamily: 'Archivo',
          fontWeight: FontWeight.w700,
        ),
        headlineSmall: TextStyle(
          color: appTheme.black900,
          fontSize: getFontSize(
            24,
          ),
          fontFamily: 'Archivo',
          fontWeight: FontWeight.w700,
        ),
        labelLarge: TextStyle(
          color: appTheme.black900,
          fontSize: getFontSize(
            13,
          ),
          fontFamily: 'Archivo',
          fontWeight: FontWeight.w500,
        ),
        titleLarge: TextStyle(
          color: appTheme.black900,
          fontSize: getFontSize(
            20,
          ),
          fontFamily: 'Archivo',
          fontWeight: FontWeight.w700,
        ),
        titleMedium: TextStyle(
          color: appTheme.black900,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'Archivo',
          fontWeight: FontWeight.w600,
        ),
        titleSmall: TextStyle(
          color: appTheme.black900,
          fontSize: getFontSize(
            15,
          ),
          fontFamily: 'Archivo',
          fontWeight: FontWeight.w500,
        ),
      );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static final primaryColorScheme = ColorScheme.light(
    // Primary colors
    primary: Color(0XFF2FB0BD),
    primaryContainer: Color(0X192B2A27),
    secondary: Color(0X192B2A27),
    secondaryContainer: Color(0XFF2FB0BD),
    tertiary: Color(0X192B2A27),
    tertiaryContainer: Color(0XFF2FB0BD),

    // Background colors
    background: Color(0X192B2A27),

    // Surface colors
    surface: Color(0X192B2A27),
    surfaceTint: Color(0XFF231F20),
    surfaceVariant: Color(0XFF2FB0BD),

    // Error colors
    error: Color(0XFF231F20),
    errorContainer: Color(0XFF696969),
    onError: Color(0XFFE2BD3E),
    onErrorContainer: Color(0XFF231F20),

    // On colors(text colors)
    onBackground: Color(0XFFE6E6E6),
    onInverseSurface: Color(0XFFE2BD3E),
    onPrimary: Color(0XFF231F20),
    onPrimaryContainer: Color(0XFFE6E6E6),
    onSecondary: Color(0XFFE6E6E6),
    onSecondaryContainer: Color(0XFF231F20),
    onTertiary: Color(0XFFE6E6E6),
    onTertiaryContainer: Color(0XFF231F20),

    // Other colors
    outline: Color(0XFF231F20),
    outlineVariant: Color(0X192B2A27),
    scrim: Color(0X192B2A27),
    shadow: Color(0XFF231F20),

    // Inverse colors
    inversePrimary: Color(0X192B2A27),
    inverseSurface: Color(0XFF231F20),

    // Pending colors
    onSurface: Color(0XFFE6E6E6),
    onSurfaceVariant: Color(0XFF231F20),
  );
}

/// Class containing custom colors for a primary theme.
class PrimaryColors {
  // Amber
  Color get amber500 => Color(0XFFFFC107);

  // Black
  Color get black900 => Color(0XFF000000);

  // BlueGray
  Color get blueGray100 => Color(0XFFD9D9D9);
  Color get blueGray10001 => Color(0XFFD6D6D6);
  Color get blueGray300 => Color(0XFFA3A3B5);
  Color get blueGray400 => Color(0XFF888888);
  Color get blueGray800 => Color(0XFF2B4549);
  Color get blueGray900 => Color(0XFF292D32);

  // Cyan
  Color get cyan50 => Color(0XFFE3F6F9);
  Color get cyan5001 => Color(0XFFE2F6F8);

  // DeepOrange
  Color get deepOrange100 => Color(0XFFF8B3B3);

  // DeepPurple
  Color get deepPurple200 => Color(0XFFBA99EC);

  // Gray
  Color get gray100 => Color(0XFFF4F4F4);
  Color get gray50 => Color(0XFFF8F8F8);
  Color get gray500 => Color(0XFFACA9A9);
  Color get gray700 => Color(0XFF595252);
  Color get gray800 => Color(0XFF563F30);
  Color get gray900 => Color(0XFF252421);

  // Green
  Color get greenA100 => Color(0XFFAEE7C4);

  // Indigo
  Color get indigo600 => Color(0XFF3B5998);
  Color get indigo900 => Color(0XFF002987);
  Color get indigoA700 => Color(0XFF1A2ADF);

  // LightGreen
  Color get lightGreen500 => Color(0XFF79CD52);
  Color get lightGreen900 => Color(0XFF5F541D);

  // Lime
  Color get lime900 => Color(0XFF84552A);

  // Orange
  Color get orange100 => Color(0XFFF6D0A1);
  Color get orange200 => Color(0XFFF9C76B);

  // Red
  Color get red500 => Color(0XFFF14336);
  Color get red600 => Color(0XFFDD3333);
  Color get redA100 => Color(0XFFFF8C8C);

  // White
  Color get whiteA700 => Color(0XFFFFFFFF);
}

PrimaryColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();
