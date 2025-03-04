

import 'package:chaqchuq/app/service/local/storage_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Global {
    static late StorageService storageService;
    static Future init() async {
        WidgetsFlutterBinding.ensureInitialized();
        await EasyLocalization.ensureInitialized();
        storageService = await StorageService().init();
    }
}