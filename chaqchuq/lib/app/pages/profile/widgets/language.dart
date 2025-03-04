




import 'package:chaqchuq/app/bloc/app_bloc.dart';
import 'package:chaqchuq/app/bloc/app_event.dart';
import 'package:chaqchuq/app/bloc/app_state.dart';
import 'package:chaqchuq/app/utils/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void languageDialog(BuildContext context, CustomColors color, {required ValueChanged onClosed}) {
    showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel: "Language",
        transitionDuration: Duration(milliseconds: 400),
        transitionBuilder: (context, animation, secondaryAnimation, child) {
            Tween<Offset> tween;
            tween = Tween(begin: Offset(0, 1), end: Offset.zero);
            return SlideTransition(
                position: tween.animate(
                    CurvedAnimation(parent: animation, curve: Curves.easeInOut)
                ),
                child: child,
            );
        },
        pageBuilder: (context, _, __) => Container(
            alignment: Alignment.bottomCenter,
            child: Container(
                height: 150.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: color.white,
                ),
                child: BlocBuilder<AppBloc, AppState>(
                    builder: (context, state) {
                        return Container(
                            margin: EdgeInsets.all(20.w),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                    
                                    GestureDetector(
                                        onTap: (){
                                            context.read<AppBloc>().add(ChangeLanguage(newLocale: Locale('uz', 'UZ'), context: context));
                                            context.setLocale(Locale('uz', 'UZ'));
                                            Future.delayed(Duration(milliseconds: 500), (){Navigator.pop(context);});
                                            

                                        },
                                        child: Row(
                                            children: [
                                                SizedBox(width: 14.w, height: 14.h, child: Image.asset("assets/icons/circle.png", color: state.locale == Locale("uz", "UZ") ? color.danger : color.textColor,)),
                                                SizedBox(width: 15.w,),
                                                Text("Uzbek tili", style: TextStyle(fontFamily: "Poppins", fontSize: 18.sp, fontWeight: FontWeight.w700, color: color.textColor, decoration: TextDecoration.none),)
                                            ],
                                        ),
                                    ),
                                        
                                    
                                    SizedBox(height: 20.h),
                                    GestureDetector(
                                        onTap: (){
                                            context.read<AppBloc>().add(ChangeLanguage(newLocale: Locale('ru', 'RU'), context: context));
                                            context.setLocale(Locale('ru', 'RU'));
                                            Future.delayed(Duration(milliseconds: 500), (){Navigator.pop(context);});
                                        },
                                        child: Row(
                                            children: [
                                                SizedBox(width: 14.w, height: 14.h, child: Image.asset("assets/icons/circle.png", color: state.locale == Locale("ru", "RU") ? color.danger : color.textColor,)),
                                                SizedBox(width: 15.w,),
                                                Text("Rus tili", style: TextStyle(fontFamily: "Poppins", fontSize: 18.sp, fontWeight: FontWeight.w700, color: color.textColor, decoration: TextDecoration.none),)
                                            ],
                                        ),
                                    ),
                                ],
                            ),
                        );
                    }
                ),
            ),
        ),
    ).then(onClosed);
}
