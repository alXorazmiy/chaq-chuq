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
    final bool isOdd;
    const ProductsGridCard({super.key, required this.customColors, required this.product, required this.isOdd,});

    @override
    Widget build(BuildContext context) {
        return Transform.translate(
            offset: Offset(0, isOdd ? -40.h : 0),
          child: Stack(
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
                              color: Color.fromRGBO(255, 255, 255, 0.9),
                              borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: Column(
                              children: [
                                  Container(
                                      margin: EdgeInsets.zero,
                                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                                    //   color: Colors.teal,
                                      // width: 110.w,
                                      
                                      height: 135.h,
                                      child: Image.asset(product.image.toString()),
                                  ),
                                  Text(
                                      product.name.toString(),
                                      style: TextStyle(
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16.sp,
                                      ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                        Container(
                                            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
                                            decoration: BoxDecoration(
                                                color: product.color.withOpacity(0.4),
                                                borderRadius: BorderRadius.circular(6.r)
                                            ),
                                            child: Text("1 kg", style: TextStyle(color: product.color),),
                                        ),
                                        Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                                Text(
                                                    "${NumberFormat('#,###,###').format(product.price)}",
                                                    style:   AppTextStyle.customMontserrat( fontweight: FontWeight.bold, color: customColors.textColor)
                                                ),
                                                SizedBox(width: 5.w,),
                                                Text("UZS", style: TextStyle(color: Color(0xffe18012), fontSize: 10.sp))
                                            ],
                                        ),
                                    ],
                                  ),
                                  SizedBox(height: 5.h,)
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
                                  child: Center(
                                    child: Container(
                                        height: 30.h,
                                        width: 30.w,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: customColors.danger,
                                            shape: BoxShape.circle,
                                            boxShadow: [
                                                BoxShadow(
                                                    color: Color.fromRGBO(255, 0, 92, 0.2),
                                                    spreadRadius: 1,
                                                    blurRadius: 1,
                                                    offset: Offset(0, 1),
                                                ),
                                            ],
                                        ),
                                        child: 
                                                Image.asset(
                                                    "assets/icons/add2.png",
                                                    width: 16.w,
                                                    height: 16.w,
                                                    color: Colors.white,
                                                ),
                                                
                                                                
                                    ),
                                  ),
                              ),
                  ),
              ],
          ),
        );
    }
}
