import 'package:carousel_slider/carousel_slider.dart';
import 'package:chaqchuq/app/pages/home/bloc/home_bloc.dart';
import 'package:chaqchuq/app/pages/home/bloc/home_state.dart';
import 'package:chaqchuq/app/pages/home/widgets/carousel.dart';
import 'package:chaqchuq/app/pages/home/widgets/category.dart';
import 'package:chaqchuq/app/pages/home/widgets/header.dart';
import 'package:chaqchuq/app/pages/home/widgets/products.dart';
import 'package:chaqchuq/app/utils/colors/app_colors.dart';
import 'package:chaqchuq/app/utils/textstyle/app_textStyle.dart';
import 'package:easy_localization/easy_localization.dart';


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';



class HomePage extends StatefulWidget {
    const HomePage({super.key});

    @override
    State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    TextEditingController _searchController = TextEditingController();
    @override
    Widget build(BuildContext context) {
        final customColors = Theme.of(context).extension<CustomColors>()!;

        return Scaffold(
            body: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                    return Container(
                        child: Container(
                            color: customColors.backgroundColor,
                            child: CustomScrollView(
                                slivers: [
                                    SliverToBoxAdapter(
                                        child: HeaderWidget(customColors: customColors, searchController: _searchController)
                                    ),
                                    SliverPadding(padding: EdgeInsets.only(top:  20.h)),
                                    SliverToBoxAdapter(
                                        child: Carousel(customColors: customColors)
                                    ),
                                    SliverToBoxAdapter(
                                        child: Padding(
                                            padding: EdgeInsets.all(20.w),
                                            child: Text("ChaqChuqlar", style: AppTextStyle.customMontserrat(fontSize: 20.sp, fontweight: FontWeight.w700, color: customColors.textColor)),
                                        ),
                                    ),
                                    SliverToBoxAdapter(
                                        child: CategoryList(customColors: customColors, categoryList: state.categoryList)
                                    ),
                                    SliverToBoxAdapter(
                                        child: Padding(
                                            padding: EdgeInsets.all(20.w),
                                            child: Text("products".tr(), style: AppTextStyle.customMontserrat(fontSize: 20.sp, fontweight: FontWeight.w700, color: customColors.textColor)),
                                        ),
                                    ),
                                    SliverPadding(
                                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                                            sliver: SliverGrid(
                                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 2,
                                                    mainAxisSpacing: 40.w,
                                                    crossAxisSpacing: 15.w,
                                                    childAspectRatio: 0.65,
                                                ),
                                                delegate: SliverChildBuilderDelegate(
                                                    childCount: state.productsList.length,
                                                    (BuildContext context, int index) {
                                                        return ProductsGridCard(customColors: customColors, product: state.productsList[index]);
                                                    },
                                                ),
                                            ),
                                        ),
                        
                                    SliverPadding(padding: EdgeInsets.only(top:  50.h)),
                                ],
                            ),
                        ),
                    );
                }
            ),
        );
    }
}
