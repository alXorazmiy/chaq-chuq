




import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:chaqchuq/app/pages/productDetail/bloc/product_detail_bloc.dart';
import 'package:chaqchuq/app/pages/productDetail/bloc/product_detail_event.dart';
import 'package:chaqchuq/app/pages/productDetail/bloc/product_detail_state.dart';
import 'package:chaqchuq/app/pages/productDetail/widget/choose_amount.dart';
import 'package:chaqchuq/app/pages/productDetail/widget/product_detail_card.dart';
import 'package:chaqchuq/app/utils/colors/app_colors.dart';
import 'package:chaqchuq/app/utils/textstyle/app_textStyle.dart';
import 'package:chaqchuq/app/widgets/toast.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailPage extends StatefulWidget {
    const ProductDetailPage({super.key});
    static const String routeName = "/product_detail_page";

    @override
    State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
    @override
    Widget build(BuildContext context) {
        final customColors = Theme.of(context).extension<CustomColors>()!;

        return Scaffold(
        backgroundColor: customColors.white,
        body: BlocBuilder<ProductDetailBloc, ProductDetailState>(
            builder: (context, state) {
            return 
                Stack(
                  children: [
                    Column(
                        children: [
                            const ProductDetailCard(),
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                    Expanded(
                                      child: Container(
                                          margin: EdgeInsets.fromLTRB(20.w, 10.h, 0, 0),
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                          state.product.name.toString(),
                                          style: AppTextStyle.customMontserrat(fontSize: 24.sp, fontweight: FontWeight.w900),
                                          ),
                                      ),
                                    ),
                                    Container(
                                        width: 130.w,
                                        margin: EdgeInsets.only(right:  20.w),
                                        decoration: BoxDecoration(
                                            color: customColors.danger,
                                            borderRadius: BorderRadius.circular(20.r)
                                        ),
                                        child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                                GestureDetector(
                                                    onTap: (){
                                                        context.read<ProductDetailBloc>().add(DecrementProduct());
                                                    },
                                                    child: Container(
                                                        width: 30.w,
                                                        height: 30.h,
                                                        
                                                        padding: EdgeInsets.all(7.w),
                                                        child: Image.asset(
                                                            "assets/icons/remove.png",
                                                            color: Colors.white,
                                                        ),
                                                    ),
                                                ),
                                                SizedBox(width: 10.w),
                                                Container(width: 40.w, alignment: Alignment.center ,child: Text("${state.product.amount.toString()} kg", style: AppTextStyle.customMontserrat(fontSize: 12.sp, color: Colors.white))),
                                                SizedBox(width: 10.w),
                                                GestureDetector(
                                                    onTap: (){
                                                        context.read<ProductDetailBloc>().add(IncrementProduct());
                                                    },
                                                    child: Container(
                                                        width: 30.w,
                                                        height: 30.h,
                                                        padding: EdgeInsets.all(7.w),
                                                        child: Image.asset(
                                                            "assets/icons/add2.png",
                                                            color: Colors.white,
                                                        ),
                                                    ),
                                                ),
                                            ],
                                        ),
                                    )
                            ],
                        ),
                        Container(
                            margin: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 0),
                            alignment: Alignment.centerLeft,
                            // color: Colors.black,
                            child: Text(
                            "description",
                            style: AppTextStyle.customMontserrat(
                                fontSize: 18.sp, fontweight: FontWeight.w400),
                            ),
                        ),
                        
                        ],
                    ),
                    Positioned(
                        bottom: 8.h,
                        right: 8.w,
                        left: 8.w,
                        child: Container(
                            height: 80.h,
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            decoration: BoxDecoration(
                                color: customColors.danger,
                                borderRadius: BorderRadius.circular(20.r)
                            ),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                    Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                            Text("Umimiy summa", style: TextStyle(fontFamily: "Poppins", fontSize: 12.sp, color: Color.fromRGBO(255, 255, 255, 0.9)),),
                                            Text("${NumberFormat('#,###,###').format(state.product.amount * state.product.price)} UZS",style: TextStyle(color: Colors.white,fontSize: 24.sp, fontFamily: "Poppins", fontWeight: FontWeight.w700))
                                        ],
                                    ),
                                    Container(
                                        child: GestureDetector(
                                            onTap: (){
                                                toastInfo(msg: "${state.product.name} savatga qo'shildi");
                                                context.read<ProductDetailBloc>().add(AddBag(context: context));
                                            },
                                            child: Container(
                                                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius: BorderRadius.circular(20.r)
                                                ),
                                                child: Text("SAVATGA QO'SHISH", style: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.w600, color: customColors.danger))
                                            ),
                                        ),
                                    )
                                ],
                            ),
                        ),
                    )
                  ],
                );
            },
        ),
        );
    }
}