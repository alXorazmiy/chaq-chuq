



// Center(
//                         child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                             Text(
//                             'Rejimni almashtirish uchun tugmani bosing',
//                             style: TextStyle(color: customColors.textColor),
//                             ),
//                             const SizedBox(height: 20),
//                             ElevatedButton(
//                             onPressed: () {
//                                 context.read<AppBloc>().add(ChangeTheme(themeMode: "light"));
//                             },
//                             child: Text("day".tr()),
//                             ),
//                             ElevatedButton(
//                             onPressed: () {
//                                 context.read<AppBloc>().add(ChangeTheme(themeMode: "dark"));
//                             },
//                             child: Text('night'.tr()),
//                             ),
//                             ElevatedButton(
//                             onPressed: () {
//                                 context
//                                     .read<AppBloc>()
//                                     .add(ChangeTheme(themeMode: "system"));
//                             },
//                             child: Text('system'.tr()),
//                             ),
//                             Text(
//                             'change_language'.tr(),
//                             style: TextStyle(color: customColors.textColor),
//                             ),
//                             const SizedBox(height: 20),
//                             ElevatedButton(
//                             onPressed: () {
//                                 context.read<AppBloc>().add(ChangeLanguage(
//                                     newLocale: Locale('uz', 'UZ'), context: context));
//                                 context.setLocale(Locale('uz', 'UZ'));
//                             },
//                             child: const Text('uzbek tili'),
//                             ),
//                             ElevatedButton(
//                             onPressed: () {
//                                 context.read<AppBloc>().add(ChangeLanguage(
//                                     newLocale: Locale('ru', 'RU'), context: context));
//                                 context.setLocale(Locale('ru', 'RU'));
//                             },
//                             child: const Text('Rus tili'),
//                             ),
//                             ElevatedButton(
//                             onPressed: () {
//                                 context.read<AppBloc>().add(ChangeLanguage(
//                                     newLocale: Locale('en', 'US'), context: context));
//                                 context.setLocale(Locale('en', 'US'));
//                             },
//                             child: const Text('Ingliz tili'),
//                             ),
//                         ],
//                         ),
//                     ),
                    