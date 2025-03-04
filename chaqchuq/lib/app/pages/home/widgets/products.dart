import 'package:chaqchuq/app/model/products.dart';
import 'package:chaqchuq/app/pages/bag/bloc/bag_bloc.dart';
import 'package:chaqchuq/app/pages/bag/bloc/bag_event.dart';
import 'package:chaqchuq/app/pages/home/bloc/home_bloc.dart';
import 'package:chaqchuq/app/pages/home/bloc/home_event.dart';
import 'package:chaqchuq/app/pages/productDetail/bloc/product_detail_bloc.dart';
import 'package:chaqchuq/app/pages/productDetail/bloc/product_detail_event.dart';
import 'package:chaqchuq/app/pages/productDetail/product_detail_page.dart';
import 'package:chaqchuq/app/utils/colors/app_colors.dart';
import 'package:chaqchuq/app/utils/textstyle/app_textStyle.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsGridCard extends StatelessWidget {
    final CustomColors customColors;
    final ProductsModel product;

    const ProductsGridCard({super.key, required this.customColors, required this.product});

    @override
    Widget build(BuildContext context) {
        return Stack(
            // clipBehavior: Clip.none,
            alignment: AlignmentDirectional.topCenter,
            children: [
                GestureDetector(
                    onTap: (){
                        context.read<ProductDetailBloc>().add(InitialProduct(product: product));
                        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => ProductDetailPage()));
                    },
                    child: Container(
                        width: 1.sw,
                        padding: EdgeInsets.zero,
                        decoration: BoxDecoration(
                            color: customColors.white,
                            borderRadius: BorderRadius.circular(20.r),
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                                Container(
                                    margin: EdgeInsets.zero,
                                    padding: EdgeInsets.zero,
                                    // color: Colors.teal,
                                    width: 110.w,
                                    height: 110.h,
                                    child: Image.asset(product.image.toString()),
                                ),
                                Text(
                                    product.name.toString(),
                                    style: TextStyle(
                                        fontFamily: "Titan",
                                        fontWeight: FontWeight.normal,
                                        fontSize: 16.sp,
                                    ),
                                ),
                                Text(
                                    "${NumberFormat('#,###,###').format(product.price)} UZS",
                                    style:   AppTextStyle.customMontserrat( fontweight: FontWeight.bold, color: customColors.warning)
                                ),
                                SizedBox(height: 30.h,)
                            ],
                        ),
                    ),
                ),
                Positioned(
                    top: 7.w,
                    right: 7.w,
                    child: product.isLike == true
                        ? Container(
                            height: 35.h,
                            width: 35.w,
                            padding: EdgeInsets.all(8.w),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromRGBO(255, 96, 22, 0.1),
                            ),
                            child: Image.asset(
                                "assets/icons/like.png",
                                color: customColors.danger,
                                width: 20.w,
                                height: 20.h,
                            ),
                        )
                        : Container(
                            height: 35.h,
                            width: 35.w,
                            padding: EdgeInsets.all(8.w),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromRGBO(0, 0, 0, 0.1),
                            ),
                            child: Image.asset(
                                "assets/icons/like2.png",
                                color: customColors.textColor,
                                width: 20.w,
                                height: 20.h,
                            ),
                        ),
                ),
                Positioned(
                    bottom: 3.h,
                    left: 0,
                    right: 0,
                    child:  product.amount > 0
                        ?   Container(
                                    height: 30.h,
                                    margin: EdgeInsets.symmetric(horizontal: 20.w),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: customColors.primary,
                                        borderRadius: BorderRadius.circular(20.r),
                                        boxShadow: [
                                            BoxShadow(
                                                color: Color.fromRGBO(0, 0, 0, 0.1),
                                                spreadRadius: 2,
                                                blurRadius: 5,
                                                offset: Offset(0, 2),
                                            ),
                                        ],
                                    ),
                                    child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                                GestureDetector(
                                                    onTap: (){
                                                        context.read<BagBloc>().add(ProductDecrement(id: product.id));
                                                    },
                                                    child: Container(
                                                        width: 20.w,
                                                        height: 20.h,
                                                        
                                                        padding: EdgeInsets.all(3.w),
                                                        child: Image.asset(
                                                            "assets/icons/remove.png",
                                                            color: Colors.white,
                                                        ),
                                                    ),
                                                ),
                                                SizedBox(width: 8.w),
                                                Container(width: 40.w, alignment: Alignment.center ,child: Text("${product.amount.toString()} kg", style: AppTextStyle.customMontserrat(fontSize: 12.sp, color: Colors.white))),
                                                SizedBox(width: 8.w),
                                                GestureDetector(
                                                    onTap: (){
                                                        context.read<BagBloc>().add(ProductIncrement(id: product.id));
                                                    },
                                                    child: Container(
                                                        width: 20.w,
                                                        height: 20.h,
                                                        padding: EdgeInsets.all(3.w),
                                                        child: Image.asset(
                                                            "assets/icons/add2.png",
                                                            color: Colors.white,
                                                        ),
                                                    ),
                                                ),
                                            ],
                                        ),
                                )
                        :   GestureDetector(
                                onTap: () {
                                    context.read<HomeBloc>().add(AddProduct(product: product, context: context));
                                },
                                child: Container(
                                    height: 30.h,
                                    margin: EdgeInsets.symmetric(horizontal: 20.w),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: customColors.success,
                                        borderRadius: BorderRadius.circular(20.r),
                                        boxShadow: [
                                            BoxShadow(
                                                color: Color.fromRGBO(0, 0, 0, 0.1),
                                                spreadRadius: 2,
                                                blurRadius: 5,
                                                offset: Offset(0, 2),
                                            ),
                                        ],
                                    ),
                                    child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                            Image.asset(
                                                "assets/icons/add.png",
                                                width: 16.w,
                                                height: 16.w,
                                                color: Colors.white,
                                            ),
                                            SizedBox(width: 10.w),
                                            Text(
                                                "Qo‘shish",
                                                style: AppTextStyle.customMontserrat(fontSize: 14.sp, fontweight: FontWeight.bold, color: Colors.white)
                                            
                                            ),
                                        ],
                                    ),
                                ),
                            ),
                ),
            ],
        );
    }
}
