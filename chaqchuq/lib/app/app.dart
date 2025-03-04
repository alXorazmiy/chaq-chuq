



import 'package:chaqchuq/app/bloc/app_bloc.dart';
import 'package:chaqchuq/app/bloc/app_state.dart';
import 'package:chaqchuq/app/pages/application/application_page.dart';
import 'package:chaqchuq/app/pages/welcome/welcome_screen.dart';
import 'package:chaqchuq/app/routes/page.dart';
import 'package:chaqchuq/app/theme/app_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class App extends StatefulWidget {
    const App({super.key});
    @override
    State<App> createState() => _AppState();
}

class _AppState extends State<App> {
    @override
    Widget build(BuildContext context) {
        return EasyLocalization(
            supportedLocales: const [
                // Locale("en", "US"),
                Locale("ru", "RU"),
                Locale("uz", "UZ"),
            ],
            path: 'assets/languages',
            child: MultiBlocProvider(
                providers: [...AppPages.allBlocProviders(context)],
                child: ScreenUtilInit(
                    builder: (context, state) {
                        return BlocBuilder<AppBloc, AppState>(
                                builder: (context, state) {
                                    return MaterialApp(
                                        debugShowCheckedModeBanner: false,
                                        theme: AppTheme.light,
                                        darkTheme: AppTheme.dark,
                                        themeMode: state.themeMode,
                                        onGenerateRoute: AppPages.GenerateRouteSettings,
                                        supportedLocales: context.supportedLocales,
                                        localizationsDelegates: context.localizationDelegates,
                                        locale: state.locale,
                                        // home: ApplicationPage(),
                                    );
                                }
                        );
                    }
                ),
            ),
        );
    }
}
