import 'package:chaqchuq/app/pages/productDetail/bloc/product_detail_bloc.dart';
import 'package:chaqchuq/app/pages/productDetail/bloc/product_detail_event.dart';
import 'package:chaqchuq/app/pages/productDetail/bloc/product_detail_state.dart';
import 'package:chaqchuq/app/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ProductDetailCard extends StatelessWidget {
 
    const ProductDetailCard();

    @override
    Widget build(BuildContext context) {
        final customColors = Theme.of(context).extension<CustomColors>()!;
        return Container(
            height: 0.5.sh,
            width: 1.sw,
            padding: EdgeInsets.only(top: 30.h, left: 20.w, right: 20.w),
            decoration: BoxDecoration(
                // color: customColors.danger,
            ),
            child: BlocBuilder <ProductDetailBloc, ProductDetailState>(
                builder: (context, state) {
                    return Column(
                        children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                    Container(
                                    height: 44.h,
                                    width: 44.w,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10.r)
                                    ),
                                    child: IconButton(
                                        onPressed: (){
                                            Navigator.of(context).pushNamedAndRemoveUntil("/application", (route)=>false);
                                        }, 
                                        icon: const Icon(Icons.arrow_back_ios)
                                    ),
                                    ),
                                    GestureDetector(
                                        onTap: (){
                                            context.read<ProductDetailBloc>().add(IsLike());
                                        },
                                        child: state.product.isLike == true
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
                                        )
                                ],
                            ),
                            Expanded(
                                child:  Container(
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                        // color: Colors.black
                                    ),
                                    child: Image.asset(state.product.image),
                                ),

                            ),
                        ],
                    );
                }
            )
        );
    }
}
