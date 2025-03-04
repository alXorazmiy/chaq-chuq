


import 'package:chaqchuq/app/bloc/app_bloc.dart';
import 'package:chaqchuq/app/bloc/app_event.dart';
import 'package:chaqchuq/app/global/app_global.dart';
import 'package:chaqchuq/app/utils/colors/app_colors.dart';
import 'package:chaqchuq/app/utils/contants/app_constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LanguageScreen extends StatefulWidget {
    const LanguageScreen({super.key});

    @override
    State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
    @override
    Widget build(BuildContext context) {
        final customColors = Theme.of(context).extension<CustomColors>()!;

        return Scaffold(
            backgroundColor: customColors.backgroundColor,
            body: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                    Expanded(
                        child: Container(
                            width: 1.sw,
                            color: customColors.white,
                            alignment: Alignment.center,
                            child: Text("ChaqChuq", style: TextStyle(fontFamily: "Titan", fontSize: 30.sp, color: customColors.firstColor),)
                        ),
                    ),
                    Container(
                        height: 400.h,
                        padding: EdgeInsets.symmetric(horizontal: 25.w),
                        child: Column(
                            children: [
                            Column(
                                children: [
                                    GestureDetector(
                                        onTap: (){
                                            context.read<AppBloc>().add(ChangeLanguage(newLocale: Locale('uz', 'UZ'), context: context));
                                            context.setLocale(Locale('uz', 'UZ'));
                                        },
                                        child: Container(
                                            height: 56,
                                            
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                border: Border.all(
                                                    width: 1,
                                                    color: BlocProvider.of<AppBloc>(context).state.locale.countryCode.toString() == 'UZ' ? customColors.primary : Colors.grey
                                                )
                                            ),
                                            child: Padding(
                                                padding: const EdgeInsets.all(10.0),
                                                child: Row(
                                                    children: [
                                                        Image.asset("assets/icons/uz.png", width: 20.w, height: 20.h),
                                                        const SizedBox(width: 5),
                                                        Text("O'zbek", style: TextStyle(fontFamily: "Montserrat", fontWeight: FontWeight.w600, fontSize: 16))
                                                    ],
                                                ),
                                            ),
                                        ),
                                    ),
                                    SizedBox(height: 20.h,),
                                    GestureDetector(
                                        onTap: (){
                                            context.read<AppBloc>().add(ChangeLanguage(newLocale: Locale('ru', 'RU'), context: context));
                                            context.setLocale(Locale('ru', 'RU'));
                                        },
                                        child: Container(
                                            height: 56,
                                            
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                border: Border.all(
                                                    width: 1,
                                                    color: BlocProvider.of<AppBloc>(context).state.locale.countryCode.toString() == 'RU' ? customColors.primary : Colors.grey
                                                )
                                            ),
                                            child: Padding(
                                                padding: const EdgeInsets.all(10.0),
                                                child: Row(
                                                    children: [
                                                        Image.asset("assets/icons/ru.png", width: 20.w, height: 20.h),
                                                        const SizedBox(width: 5),
                                                        Text("Русский", style: TextStyle(fontFamily: "Montserrat", fontWeight: FontWeight.w600, fontSize: 16))
                                                    ],
                                                ),
                                            ),
                                        ),
                                    ),
                                    
                                ],
                            ),
                            SizedBox(height: 100.h,),
                            GestureDetector(
                                        onTap: (){
                                            Global.storageService.setBool(AppConstants.DEVICE_FIRST_OPEN, true);
                                            Navigator.of(context).pushNamedAndRemoveUntil("/application", (route)=>false);
                                        },
                                        child: Container(
                                            height: 59,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                color:  customColors.primary,
                                                borderRadius: BorderRadius.circular(10)
                                            ),
                                            child: Text("Davom etish", style: TextStyle(fontFamily:"Montserrat", fontWeight: FontWeight.w700, fontSize: 16.sp, color: customColors.white)),
                                        ),
                                    )
                            ],
                        ),
                        ),
                     
                   
                ],
            ),
        );
    }
}