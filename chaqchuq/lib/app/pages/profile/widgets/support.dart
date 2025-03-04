




import 'package:chaqchuq/app/bloc/app_bloc.dart';
import 'package:chaqchuq/app/bloc/app_event.dart';
import 'package:chaqchuq/app/bloc/app_state.dart';
import 'package:chaqchuq/app/utils/colors/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void supportDialog(BuildContext context, CustomColors color) {
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
                    color: Colors.white,
                ),
                child: Column(
                    children: [
                        Row(
                            children: [
                                SizedBox(
                                    width: 14.w,
                                    height: 14.h,
                                    child: Image.asset("assets/icons/phone.png"),
                                ),
                                Text("+998 99 803 1997", style: TextStyle(fontFamily: "Poppins", fontSize: 18.sp, fontWeight: FontWeight.w700, color: color.textColor, decoration: TextDecoration.none))
                            ],
                        ),
                        Row(
                            children: [
                                SizedBox(
                                    width: 14.w,
                                    height: 14.h,
                                    child: Image.asset("assets/icons/mail.png"),
                                ),
                                Text("Chaqchuquz@gmail.com", style: TextStyle(fontFamily: "Poppins", fontSize: 18.sp, fontWeight: FontWeight.w700, color: color.textColor, decoration: TextDecoration.none))
                            ],
                        ),
                        Row(
                            children: [
                                SizedBox(
                                    width: 14.w,
                                    height: 14.h,
                                    child: Image.asset("assets/icons/telegram.png"),
                                ),
                                Text("chaqchuqbot", style: TextStyle(fontFamily: "Poppins", fontSize: 18.sp, fontWeight: FontWeight.w700, color: color.textColor, decoration: TextDecoration.none))
                            ],
                        ),

                    ],
                ),
            ),
        ),
    );
}
