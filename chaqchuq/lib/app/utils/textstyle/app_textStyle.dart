




import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyle {

    static TextStyle customMontserrat({Color? color, FontWeight? fontweight,  double fontSize = 16}) => TextStyle(
        fontFamily: 'Montserrat',
        fontWeight: fontweight ?? FontWeight.normal,
        fontSize: fontSize.sp,
        color: color ?? Colors.black,
    );
}


