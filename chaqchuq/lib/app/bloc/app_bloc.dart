
import 'package:chaqchuq/app/bloc/app_event.dart';
import 'package:chaqchuq/app/bloc/app_state.dart';
import 'package:chaqchuq/app/global/app_global.dart';
import 'package:chaqchuq/app/utils/contants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class AppBloc extends Bloc<AppEvent, AppState> {
    AppBloc() : super(const AppState(themeMode: ThemeMode.light, locale: Locale("uz"))) {
        on<ChangeTheme>(_changeTheme);
        on<ChangeLanguage>(_onChangeLanguage);
        _loadTheme();
        _onLoadLanguage();
    }

    void _loadTheme() async {
        final mode = Global.storageService.getString(AppConstants.DEVICE_THEME_MODE);

        if (mode == "light") { emit(state.copyWith(themeMode: ThemeMode.light)); }
        else if (mode == "dark") { emit(state.copyWith(themeMode: ThemeMode.dark)); }
        else { emit(state.copyWith(themeMode: ThemeMode.system)); } 
    }



    void _onLoadLanguage() async {
        final language = Global.storageService.getString(AppConstants.DEVICE_LANGUAGE);

        if(language == "en") {
            emit(state.copyWith(locale: Locale("en", "US")));
        }
        else if (language == "ru") {
            emit(state.copyWith(locale: Locale("ru", "RU")));
        } else {
            emit(state.copyWith(locale: Locale("uz", "UZ")));
        }

    }

    void _changeTheme(ChangeTheme event, emit) async {
        if (event.themeMode == "light") { emit(state.copyWith(themeMode: ThemeMode.light)); }
        else if (event.themeMode  == "dark") { emit(state.copyWith(themeMode: ThemeMode.dark)); }
        else { emit(state.copyWith(themeMode: ThemeMode.system)); } 
        
        await Global.storageService.setString(AppConstants.DEVICE_THEME_MODE, event.themeMode);
    }



    void _onChangeLanguage(ChangeLanguage event, emit) async {
        if(event.newLocale == Locale("en", "US")) {
            emit(state.copyWith(locale: Locale("en", "US")));
        }
        else if (event.newLocale == Locale("ru", "RU")) {
            emit(state.copyWith(locale: Locale("ru", "RU")));
        } else {
            emit(state.copyWith(locale: Locale("uz", "UZ")));
        }
        await Global.storageService.setString(AppConstants.DEVICE_LANGUAGE, event.newLocale.toString());
        // event.context.setLocale(event.newLocale);
   
    }



}