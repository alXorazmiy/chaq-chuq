import 'package:flutter/material.dart';

class AppState {
    final ThemeMode themeMode;
    final Locale locale;
    const AppState({required this.themeMode, required this.locale});

    AppState copyWith({
        ThemeMode? themeMode,
        Locale? locale
    }){
        return AppState(
            themeMode: themeMode ?? this.themeMode,
            locale: locale ?? this.locale,
        );
    }
}