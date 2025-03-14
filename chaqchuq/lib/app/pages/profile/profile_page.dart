


import 'package:chaqchuq/app/bloc/app_bloc.dart';
import 'package:chaqchuq/app/bloc/app_event.dart';
import 'package:chaqchuq/app/bloc/app_state.dart';
import 'package:chaqchuq/app/pages/address/address_page.dart';
import 'package:chaqchuq/app/pages/profile/widgets/language.dart';
import 'package:chaqchuq/app/pages/profile/widgets/support.dart';
import 'package:chaqchuq/app/utils/colors/app_colors.dart';
import 'package:chaqchuq/app/utils/textstyle/app_textStyle.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
    bool showLanguageDialog = false;
    @override
    Widget build(BuildContext context) {
        final customColors = Theme.of(context).extension<CustomColors>()!;

        return Scaffold(
            backgroundColor: customColors.backgroundColor,
            body: Column(
                children: [
                    Container(
                        height: 150.h,
                        width: 1.sw,
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.all(20.w),
                        decoration: BoxDecoration(
                            color: customColors.danger
                        ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                                Text("Raxmonov Husniddin", style: AppTextStyle.customMontserrat(color: Colors.white, fontweight: FontWeight.w600, fontSize: 24.sp)),
                                Row(
                                    children: [
                                        SizedBox( width: 16.w, height: 16.h,  child: Image.asset("assets/icons/phone.png", color: Colors.white,)),
                                        SizedBox(width: 10.w),
                                        Text("+998 99 803 1997",style: AppTextStyle.customMontserrat(color: Colors.white))
                                    ],
                                )
                            ],
                        ),
                    ),
                    Padding(
                        padding: EdgeInsets.all(20.w),
                        child: Column(
                            children: [
                                GestureDetector(
                                    child: Container(
                                        margin: EdgeInsets.only(top: 30.h),
                                        child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                                Row(
                                                    children: [
                                                        SizedBox(
                                                            width: 24.w,
                                                            height: 24.h,
                                                            child: Lottie.asset("assets/lottie/person.json"),
                                                        ), 
                                                        SizedBox(width: 15.w),
                                                        Text("information".tr(), style:TextStyle(fontFamily: "Poppins", fontSize: 18.sp, fontWeight: FontWeight.w500)),
                                                    ],
                                                ),
                                                SizedBox(
                                                    width: 14.w,
                                                    height: 14.h,
                                                    child: Image.asset("assets/icons/right-arrow.png", color: Colors.grey),
                                                ),
                                            ],
                                        ),
                                    ),
                                ),
                                GestureDetector(
                                    onTap: (){
                                        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => AddressPage()));
                                    },
                                    child: Container(
                                        margin: EdgeInsets.only(top: 30.h),
                                        child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                                Row(
                                                    children: [
                                                        SizedBox(
                                                            width: 30.w,
                                                            height: 30.h,
                                                            child: Lottie.asset("assets/lottie/location.json"),
                                                        ), 
                                                        SizedBox(width: 15.w),
                                                        Text("address".tr(), style:TextStyle(fontFamily: "Poppins", fontSize: 18.sp, fontWeight: FontWeight.w500)),
                                                    ],
                                                ),
                                                SizedBox(
                                                    width: 14.w,
                                                    height: 14.h,
                                                    child: Image.asset("assets/icons/right-arrow.png", color: Colors.grey),
                                                ),
                                            ],
                                        ),
                                    ),
                                ),
                                GestureDetector(
                                    onTap: (){
                                        languageDialog(context, customColors, onClosed: (_){});
                                    },
                                    child: Container(
                                        margin: EdgeInsets.only(top: 30.h),
                                        child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                                Row(
                                                    children: [
                                                        SizedBox(
                                                            width: 18.w,
                                                            height: 18.h,
                                                            child: Image.asset("assets/icons/moon.png", color: customColors.textColor),
                                                        ), 
                                                        SizedBox(width: 15.w),
                                                        Text("dark_mode".tr(), style:TextStyle(fontFamily: "Poppins", fontSize: 18.sp, fontWeight: FontWeight.w500)),
                                                    ],
                                                ),
                                                SizedBox(
                                                    width: 30.w,
                                                    height: 30.h,
                                                    child: BlocBuilder<AppBloc, AppState>(
                                                        builder: (context, state){
                                                            return Transform.scale(
                                                                scale: 0.8,  // Kattalashtirish koeffitsiyenti (1.0 - oddiy, 1.5 - 50% katta)
                                                              child: Switch(
                                                                  value: state.themeMode == ThemeMode.dark ? true : false, 
                                                                  onChanged: (value){
                                                                      if (value) {
                                                                          context.read<AppBloc>().add(ChangeTheme(themeMode: "dark"));
                                                                      } else {
                                                                          context.read<AppBloc>().add(ChangeTheme(themeMode: "light"));
                                                                      }
                                                                  },
                                                                  activeColor: Colors.white,           // Tugma (thumb) rangi ON holatda
                                                                  activeTrackColor: customColors.primary,       // Yoqilgan track rangi
                                                                  inactiveThumbColor: Colors.grey,     // Tugma (thumb) rangi OFF holatda
                                                                  inactiveTrackColor: Colors.black12,
                                                                  trackOutlineColor: MaterialStateProperty.all(Colors.transparent),
                                                              ),
                                                            );
                                                        },
                                                    ),
                                                  
                                                ),
                                            ],
                                        ),
                                    ),
                                ),
                                GestureDetector(
                                    onTap: (){
                                        languageDialog(context, customColors, onClosed: (_){});
                                    },
                                    child: Container(
                                        margin: EdgeInsets.only(top: 30.h),
                                        child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                                Row(
                                                    children: [
                                                        SizedBox(
                                                            width: 18.w,
                                                            height: 18.h,
                                                            child: Image.asset("assets/icons/language.png", color: customColors.textColor),
                                                        ), 
                                                        SizedBox(width: 15.w),
                                                        Text("language".tr(), style:TextStyle(fontFamily: "Poppins", fontSize: 18.sp, fontWeight: FontWeight.w500)),
                                                    ],
                                                ),
                                                SizedBox(
                                                    width: 14.w,
                                                    height: 14.h,
                                                    child: Image.asset("assets/icons/right-arrow.png", color: Colors.grey),
                                                ),
                                            ],
                                        ),
                                    ),
                                ),
                                GestureDetector(
                                    child: Container(
                                        margin: EdgeInsets.only(top: 30.h),
                                        child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                                Row(
                                                    children: [
                                                        SizedBox(
                                                            width: 18.w,
                                                            height: 18.h,
                                                            child: Image.asset("assets/icons/like.png", color: customColors.textColor),
                                                        ), 
                                                        SizedBox(width: 15.w),
                                                        Text("likes".tr(), style:TextStyle(fontFamily: "Poppins", fontSize: 18.sp, fontWeight: FontWeight.w500)),
                                                    ],
                                                ),
                                                SizedBox(
                                                    width: 14.w,
                                                    height: 14.h,
                                                    child: Image.asset("assets/icons/right-arrow.png", color: Colors.grey),
                                                ),
                                            ],
                                        ),
                                    ),
                                ),
                                GestureDetector(
                                    onTap: (){
                                        supportDialog(context, customColors);
                                    },
                                    child: Container(
                                        margin: EdgeInsets.only(top: 30.h),
                                        child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                                Row(
                                                    children: [
                                                        SizedBox(
                                                            width: 18.w,
                                                            height: 18.h,
                                                            child: Image.asset("assets/icons/support.png", color: customColors.textColor),
                                                        ), 
                                                        SizedBox(width: 15.w),
                                                        Text("support".tr(), style:TextStyle(fontFamily: "Poppins", fontSize: 18.sp, fontWeight: FontWeight.w500)),
                                                    ],
                                                ),
                                                SizedBox(
                                                    width: 14.w,
                                                    height: 14.h,
                                                    child: Image.asset("assets/icons/right-arrow.png", color: Colors.grey),
                                                ),
                                            ],
                                        ),
                                    ),
                                )
                            ],
                        ),
                    )
                ],
            )
        );
    }
}