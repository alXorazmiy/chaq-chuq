



import 'package:chaqchuq/app/model/order.dart';
import 'package:chaqchuq/app/utils/colors/app_colors.dart';
import 'package:chaqchuq/app/utils/textstyle/app_textStyle.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderCard extends StatelessWidget {

    final CustomColors customColors;
    final Order order;
    const OrderCard({super.key, required this.customColors, required this.order});

    @override
    Widget build(BuildContext context) {
        return Container(
            width: 1.sw,
            height: 130.h,
            padding: EdgeInsets.all(10.w),
            margin: EdgeInsets.only(top: 10.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: customColors.white,
                boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.1),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 2),
                    ),
                ],
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    Text("Buyurtma N°" + order.id.toString(), style: TextStyle(fontWeight: FontWeight.w600, fontFamily: "Poppins")),
                                    Text(order.date.toString(), style: TextStyle(color: Colors.grey),)
                                ],
                            ),
                            order.status == "new" 
                                ?   Row(
                                        children: [
                                            SizedBox(
                                                width: 18.w,
                                                height: 18.h,
                                                child: Image.asset("assets/icons/clock.png", color: customColors.primary,),
                                            ),
                                            Text("Yangi", style: TextStyle(fontFamily: "Poppins", color: customColors.primary))
                                        ],
                                    ) 
                                :   order.status == "wait" 
                                        ?   Row(
                                                children: [
                                                    SizedBox(
                                                        width: 18.w,
                                                        height: 18.h,
                                                        child: Image.asset("assets/icons/wait.png", color: customColors.warning,),
                                                    ),
                                                    Text("Jarayonda", style: TextStyle(fontFamily: "Poppins", color: customColors.warning))
                                                ],
                                            ) 
                                        :   order.status == "cancel" 
                                            ?   Row(
                                                    children: [
                                                        SizedBox(
                                                            width: 18.w,
                                                            height: 18.h,
                                                            child: Image.asset("assets/icons/cancel.png", color: customColors.textColor,),
                                                        ),
                                                        Text("Bekor qilingan", style: TextStyle(fontFamily: "Poppins", color: customColors.textColor))
                                                    ],
                                                ) 
                                            :   order.status == "ready" 
                                                ?   Row(
                                                        children: [
                                                            SizedBox(
                                                                width: 18.w,
                                                                height: 18.h,
                                                                child: Image.asset("assets/icons/truck.png", color: customColors.success,),
                                                            ),
                                                            Text("Yo'lda", style: TextStyle(fontFamily: "Poppins", color: customColors.success))
                                                        ],
                                                    ) 
                                                :   order.status == "finish" 
                                                    ?   Row(
                                                            children: [
                                                                SizedBox(
                                                                    width: 18.w,
                                                                    height: 18.h,
                                                                    child: Image.asset("assets/icons/hands.png", color: customColors.danger,),
                                                                ),
                                                                Text("Yetkazib berilgan", style: TextStyle(fontFamily: "Poppins", color: customColors.danger))
                                                            ],
                                                        ) 
                                                    : SizedBox()
                        ],
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                            Row(
                                children: [
                                    SizedBox(
                                        height: 50.h,
                                        width: 200.w,
                                        child: Stack(
                                            children: List.generate(
                                                order.images.length, (index) {
                                                    return  Positioned(
                                                        top: 0,
                                                        left: index * 35.w,
                                                        child: Container(
                                                            width: 50.w,
                                                            height: 50.h,
                                                            decoration: BoxDecoration(
                                                                color: Color(0xfff7f7f7),
                                                                shape: BoxShape.circle,
                                                            ),
                                                            child: Image.asset(
                                                                    order.images[index],
                                                        
                                                            ),
                                                        ),
                                                    );
                                                }
                                            ),
                                        ),
                                    )
                                ],
                            ),
                            Text(
                                "${NumberFormat('#,###,###').format(300000)} UZS",
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