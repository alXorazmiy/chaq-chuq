





import 'package:chaqchuq/app/model/category.dart';
import 'package:chaqchuq/app/model/products.dart';
import 'package:chaqchuq/app/utils/colors/app_colors.dart';
import 'package:chaqchuq/app/utils/textstyle/app_textStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class PopularList extends StatelessWidget {
    final CustomColors customColors;
    final List<ProductsModel> products;
    const PopularList({super.key, required this.customColors, required this.products});

    @override
    Widget build(BuildContext context) {
        return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                children: [
                    SizedBox(width: 20.w),
                    Row(
                        children: products.map((products) {
                            return Padding(
                                padding: EdgeInsets.only(right: 20.w),
                                child: Container(
                                    height: 150.h,
                                    width: 0.8.sw,
                                    padding: EdgeInsets.only(top: 5.w, left: 10.w, right: 10.w, bottom: 5.w),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10.r),
                                    ),
                                    child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                            Image.asset(products.image.toString(), width: 0.3.sw,),
                                            Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                    Text(products.name.toString(), style: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.bold, fontSize: 20.sp)),
                                                    Row(
                                                        children: [
                                                            SizedBox(
                                                                width: 20.w,
                                                                height: 20.h,
                                                                child: Image.asset("assets/icons/fire.png"),
                                                            ),
                                                            Text("233 kaloriya")
                                                        ],
                                                    ),
                                                    SizedBox(height: 15.h),
                                                    Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                        children: [
                                                            Container(
                                                                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
                                                                decoration: BoxDecoration(
                                                                    color: products.color.withOpacity(0.4),
                                                                    borderRadius: BorderRadius.circular(6.r)
                                                                ),
                                                                child: Text("1 kg", style: TextStyle(color: products.color),),
                                                            ),
                                                            SizedBox(width: 20.w),
                                                            Row(
                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                children: [
                                                                    Text(
                                                                        "${NumberFormat('#,###,###').format(products.price)}",
                                                                        style:   AppTextStyle.customMontserrat( fontweight: FontWeight.bold, color: customColors.textColor)
                                                                    ),
                                                                    SizedBox(width: 5.w,),
                                                                    Text("UZS", style: TextStyle(color: Color(0xffe18012), fontSize: 10.sp))
                                                                ],
                                                            ),
                                                        ],
                                                    ),
                                                ],
                                            ),
                                        ],
                                    ),
                                ),
                            );
                        }).toList(),
                    ),
                ],
            ),
        );
  }
}