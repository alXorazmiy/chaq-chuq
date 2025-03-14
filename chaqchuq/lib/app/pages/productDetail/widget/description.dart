



import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildIngredientItem(String title, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontSize: 16.sp)),
          Text(value, style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  // Foyda UI elementi
  Widget buildBenefitItem(IconData icon, String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: Row(
        children: [
          Icon(icon, color: Colors.green, size: 24.sp),
          SizedBox(width: 10.w),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 16.sp),
            ),
          ),
        ],
      ),
    );
  }