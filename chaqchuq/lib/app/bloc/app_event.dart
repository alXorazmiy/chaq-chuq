
import 'dart:ui';

import 'package:flutter/material.dart';

abstract class AppEvent {}



class ChangeTheme extends AppEvent {
    final String themeMode;
    ChangeTheme({required this.themeMode});
}

class ChangeLanguage extends AppEvent {
    final Locale newLocale;
    final BuildContext context;
    ChangeLanguage({required this.newLocale, required this.context});
}