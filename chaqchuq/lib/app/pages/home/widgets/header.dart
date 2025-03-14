





import 'package:chaqchuq/app/utils/colors/app_colors.dart';
import 'package:chaqchuq/app/utils/textstyle/app_textStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderWidget extends StatelessWidget {
    const HeaderWidget({
        super.key,
        required this.customColors,
        required TextEditingController searchController,
    }) : _searchController = searchController;

    final CustomColors customColors;
    final TextEditingController _searchController;

    @override
    Widget build(BuildContext context) {
        return Container(
            height: 100.h,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25.r),  
                    bottomRight: Radius.circular(25.r),
                ),
            ),
            child: Column(
                children: [
                    SizedBox(height: 40.h),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                            Text("Chaq-Chuq", style: TextStyle(fontFamily: "Titan", color: customColors.danger, fontSize: 30.sp)),
                            GestureDetector(
                                onTap: (){},
                                child: Container(
                                    height: 30.h,
                                    width: 30.w,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(255, 255, 255, 0.5),
                                        borderRadius: BorderRadius.circular(8.r)
                                    ),
                                    child: Stack(
                                        children: [
                                            SizedBox(
                                                height: 24.h,
                                                width: 24.w,
                                                child: Image.asset("assets/icons/notification.png", color: customColors.warning,),
                                            ),
                                            Positioned(
                                                right: 0,
                                                top: 3.h,
                                                child: Icon(Icons.circle, size: 8, color: customColors.danger,)
                                            )
                                        ],
                                    ),
                                ),
                            )
                        ],
                    ),
                    SizedBox(height: 20.h,),
                    // Container(
                    //     margin: EdgeInsets.symmetric(horizontal: 20.w),
                    //     padding: EdgeInsets.symmetric(horizontal: 10.w),
                    //     height: 35.h,
                    //     decoration: BoxDecoration(
                    //         color: Colors.white,
                    //         borderRadius: BorderRadius.circular(10.r)
                    //     ),
                    //     child: Row(
                    //         crossAxisAlignment: CrossAxisAlignment.center,
                    //         children: [
                    //             Icon(Icons.search, color: customColors.danger,),
                    //             SizedBox(width: 10.w,),
                    //             Expanded(
                    //                 child: TextField(
                    //                     controller: _searchController,
                    //                     decoration: InputDecoration(
                    //                         hintText: "Izlash",
                    //                         hintStyle: TextStyle(color: Colors.black),
                    //                         border: InputBorder.none,
                                            
                    //                     ),
                    //                     style: AppTextStyle.customMontserrat(),
                    //                 ),
                    //             )
                    //         ],
                    //     ),
                    // )
                ],
            ),
        );
    }
}