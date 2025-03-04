import 'package:chaqchuq/app/app.dart';
import 'package:chaqchuq/app/global/app_global.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
    await Global.init();
    runApp(App());
}

