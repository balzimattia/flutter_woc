import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class AppTheme {
  AppTheme._();

  static const Color _seedColor = Color(0xFF2F6FED);
  static const Color lightGreen = Color(0xFF79f779);
  static const Color lightlightGray = Color(0xFFe9e9e9);
  static const Color greenAcceso = Color(0xFF12f612);
  static const Color red = Color(0xFFfe2c2c);


  static ThemeData get light => ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: lightlightGray,
    canvasColor: lightlightGray,
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: _seedColor,
      brightness: Brightness.light,
    ).copyWith(
      primary: lightGreen,
      onPrimary: const Color(0xff000000),
      surface: const Color(0xFFFFFFFF),
      onSurface: const Color(0xffD3D3D3),
      onPrimaryContainer: const Color(0xffffffff),
    ),
    appBarTheme: const AppBarTheme(centerTitle: true, elevation: 0),
  );

  static ThemeData get dark => ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: const Color(0xFF000000),
    canvasColor: const Color(0xFF000000),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: _seedColor,
      brightness: Brightness.dark,
    ).copyWith(
      primary: lightGreen,
      onPrimary: const Color(0xffffffff),
      surface: const Color(0xFF444444),
      onSurface: const Color(0xffffffff),
      onPrimaryContainer: const Color(0xff000000)
    ),
    appBarTheme: const AppBarTheme(centerTitle: true, elevation: 0),
  );
}
