import 'package:chaqchuq/app/model/bag.dart';
import 'package:chaqchuq/app/pages/bag/bloc/bag_bloc.dart';
import 'package:chaqchuq/app/pages/bag/bloc/bag_event.dart';
import 'package:chaqchuq/app/pages/productDetail/bloc/product_detail_event.dart';
import 'package:chaqchuq/app/utils/colors/app_colors.dart';
import 'package:chaqchuq/app/utils/textstyle/app_textStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as flutter;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:rive/rive.dart';

class BagProductCard extends StatelessWidget {
    final CustomColors customColors;
    final BagModel product;
    const BagProductCard({super.key, required this.customColors, required this.product});

    @override
    Widget build(BuildContext context) {
        return Container(
            height: 80.h,
            width: 1.sw,
            margin: EdgeInsets.symmetric(vertical: 10.w),
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            decoration: BoxDecoration(
                color: customColors.white,
                borderRadius: BorderRadius.circular(20.r),
                // boxShadow: [
                //     BoxShadow(
                //         color: Color.fromRGBO(0, 0, 0, 0.1),
                //         spreadRadius: 2,
                //         blurRadius: 5,
                //         offset: Offset(0, 2),
                //     ),
                // ],
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    Row(
                        children: [
                            SizedBox(
                                width: 80.w,
                                child: flutter.Image.asset(product.image),
                            ),
                            Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    Text(
                                        product.name,
                                        style: AppTextStyle.customMontserrat(
                                            color: customColors.textColor,
                                            fontweight: FontWeight.w600
                                        ),
                                    ),
                                    SizedBox(height: 10.h),
                                    Row(
                                        children: [
                                            GestureDetector(
                                                onTap: (){
                                                    context.read<BagBloc>().add(ProductDecrement(id: product.id));
                                                },
                                                child: Container(
                                                    width: 24.w,
                                                    height: 24.h,
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(8.r),
                                                        color: Color.fromRGBO(0, 0, 0, 0.05),
                                                    ),
                                                    padding: EdgeInsets.all(7.w),
                                                    child: flutter.Image.asset(
                                                        "assets/icons/remove.png",
                                                        color: customColors.danger,
                                                    ),
                                                ),
                                            ),
                                            SizedBox(width: 10.w),
                                            Text("${product.amount} kg", style: AppTextStyle.customMontserrat(fontSize: 12.sp),),
                                            SizedBox(width: 10.w),
                                            GestureDetector(
                                                onTap: (){
                                                    context.read<BagBloc>().add(ProductIncrement(id: product.id));
                                                },
                                                child: Container(
                                                    width: 24.w,
                                                    height: 24.h,
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(8.r),
                                                        color: Color.fromRGBO(0, 0, 0, 0.05),
                                                    ),
                                                    padding: EdgeInsets.all(7.w),
                                                    child: flutter.Image.asset(
                                                        "assets/icons/add2.png",
                                                        color: customColors.danger,
                                                    ),
                                                ),
                                            ),
                                        ],
                                    )
                                ],
                            ),
                        ],
                    ),

                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                            Container(
                                width: 35.w,
                                height: 35.h,
                                child: IconButton(
                                    onPressed: () {
                                        context.read<BagBloc>().add(DeleteItemBag(id: product.id));
                                    },  
                                    icon: flutter.Image.asset(
                                        "assets/icons/delete.png",
                                        color: customColors.danger,
                                    )
                                )
                            ),
                            Text(
                                "${NumberFormat('#,###,###').format(product.totalPrice)} UZS",
                                style: AppTextStyle.customMontserrat(
                                    color: customColors.warning,
                                    fontweight: FontWeight.w600,
                                ),
                            ),
                        ],
                    )
                ],
            ),
        );
    }
}