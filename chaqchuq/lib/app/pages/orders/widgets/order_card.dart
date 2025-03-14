



import 'package:chaqchuq/app/model/order.dart';
import 'package:chaqchuq/app/utils/colors/app_colors.dart';
import 'package:chaqchuq/app/utils/textstyle/app_textStyle.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as flutter;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:rive/rive.dart';

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
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    Text("Buyurtma N°" + order.id.toString(), style: TextStyle(fontWeight: FontWeight.w600, fontFamily: "Poppins")),
                                    Text(order.date.toString(), style: TextStyle(color: Colors.grey),)
                                ],
                            ),
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
                                                            child: flutter.Image.asset(
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
                            
                        ],
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                            order.status == "wait" 
                                ?   Stack(
                                        alignment: AlignmentDirectional.topCenter,
                                        children: [
                                            Container(
                                                width: 70.w,
                                                height: 70.h,
                                                margin: EdgeInsets.only(top: 15.h),
                                                child: Lottie.asset("assets/lottie/sandclockblue.json"),
                                            ),
                                            Text("Jarayonda", style: TextStyle(fontFamily: "Poppins", color: customColors.primary))
                                       
                                        ],
                                    ) 
                                :   order.status == "cancel" 
                                    ?   Stack(
                                            alignment: AlignmentDirectional.topCenter,
                                            children: [
                                                SizedBox(
                                                    width: 90.w,
                                                    height: 90.h,
                                                    child: Lottie.asset("assets/lottie/cancel.json"),
                                                ),
                                                Text("Bekor qilingan", style: TextStyle(fontFamily: "Poppins", color: customColors.textColor)),
                                            ],
                                        ) 
                                    :   order.status == "ready" 
                                        ?   Stack(
                                                alignment: AlignmentDirectional.topCenter,
                                                children: [
                                                    Container(
                                                        width: 90.w,
                                                        height: 90.h,
                                                        // color: Colors.teal,
                                                        child: Lottie.asset("assets/lottie/delivery.json")
                                                        // child: RiveAnimation.asset("assets/riv/truck.riv", animations: ['idle', 'curves']),
                                                    ),
                                                    Text("Yo'lda", style: TextStyle(fontFamily: "Poppins", color: customColors.success)),
                                                ],
                                            ) 
                                        :   order.status == "finish" 
                                            ?   Stack(
                                                    alignment: AlignmentDirectional.topCenter,
                                                    children: [
                                                        SizedBox(
                                                            width: 80.w,
                                                            height: 80.h,
                                                            child: Lottie.asset("assets/lottie/deliveryfinish.json"),
                                                        ),
                                                        Text("Yetkazib berilgan", style: TextStyle(fontFamily: "Poppins", color: customColors.danger)),
                                                    ],
                                                ) 
                                            : SizedBox(),
                            
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