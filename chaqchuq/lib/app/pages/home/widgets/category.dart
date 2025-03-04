


import 'package:chaqchuq/app/model/category.dart';
import 'package:chaqchuq/app/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryList extends StatelessWidget {
    final CustomColors customColors;
    final List<CategoryModel> categoryList;
    const CategoryList({super.key, required this.customColors, required this.categoryList});

    @override
    Widget build(BuildContext context) {
        return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                children: [
                    SizedBox(width: 20.w),
                    Row(
                        children: categoryList.map((category) {
                            return Padding(
                                padding: EdgeInsets.only(right: 20.w),
                                child: Container(
                                    height: 80.h,
                                    width: 80.w,
                                    padding: EdgeInsets.only(top: 5.w, left: 5.w, right: 5.w, bottom: 5.w),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: customColors.categoryBackgroundColor,
                                        borderRadius: BorderRadius.circular(10.r),
                                    ),
                                    child: Column(
                                        children: [
                                            Image.asset(category.image.toString(), width: 50.w, height: 50.w),
                                            Text(category.name.toString(), textAlign: TextAlign.center),
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