import 'package:chaqchuq/app/pages/bag/bloc/bag_bloc.dart';
import 'package:chaqchuq/app/pages/bag/bloc/bag_event.dart';
import 'package:chaqchuq/app/pages/bag/bloc/bag_state.dart';
import 'package:chaqchuq/app/pages/bag/widgets/bag_product_card.dart';
import 'package:chaqchuq/app/utils/colors/app_colors.dart';
import 'package:chaqchuq/app/utils/textstyle/app_textStyle.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as flutter;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rive/rive.dart';

class BagPage extends StatefulWidget {
    const BagPage({super.key});

    @override
    State<BagPage> createState() => _BagPageState();
}

class _BagPageState extends State<BagPage> {
    @override
    void initState() {
        context.read<BagBloc>().add(BagInitial());
        super.initState();
    }

    @override
    Widget build(BuildContext context) {
        final customColors = Theme.of(context).extension<CustomColors>()!;

        return BlocBuilder<BagBloc, BagState>(
            builder: (context, state) {
                return Scaffold(
                    backgroundColor: Colors.transparent,
                    appBar: AppBar(
                        backgroundColor: customColors.danger,
                        surfaceTintColor: customColors.danger,
                        title: Text(
                            "bag".tr(),
                            style: AppTextStyle.customMontserrat(
                                fontweight: FontWeight.bold,
                                fontSize: 20.sp,
                                color: Colors.white
                            ),
                        ),
                        centerTitle: true,
                        actions: [
                            BlocBuilder<BagBloc, BagState>(
                                builder: (context, state) {
                                    return Padding(
                                        padding: EdgeInsets.only(right: 20.w),
                                        child: IconButton(
                                            onPressed: () {
                                                // BlocProvider.of<BagBloc>(context).add(DeleteBag());
                                            },
                                            icon: flutter.Image.asset(
                                                "assets/icons/delete.png",
                                                width: 20,
                                                color: customColors.white
                                            ),
                                        ),
                                    );
                                },
                            )
                        ],
                    ),
                    body: state.bag_product_list.isEmpty
                        ? SizedBox(
                            width: 1.sw,
                            height: 400,
                            child: RiveAnimation.asset("assets/riv/shopping_cart.riv"),
                        )
                        : CustomScrollView(
                            slivers: [
                                SliverPadding(
                                    padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
                                    sliver: SliverList(
                                        delegate: SliverChildBuilderDelegate(
                                            childCount: state.bag_product_list.length,
                                            (BuildContext context, int index) {
                                                return BagProductCard(
                                                    customColors: customColors,
                                                    product: state.bag_product_list[index],
                                                );
                                            },
                                        ),
                                    ),
                                ),
                                SliverPadding(
                                    padding: EdgeInsets.only(top: 50.w),
                                ),
                                SliverToBoxAdapter(
                                    child: Container(
                                        width: 1.sw,
                                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                                        child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                                Text(
                                                    "Umumiy summa:",
                                                    style: AppTextStyle.customMontserrat(
                                                        fontSize: 20.sp,
                                                        fontweight: FontWeight.bold,
                                                        color: customColors.textColor
                                                    ),
                                                ),
                                                Text(
                                                    "${NumberFormat('#,###,###').format(state.totalPrice)} UZS",
                                                    style: AppTextStyle.customMontserrat(
                                                        fontSize: 20.sp,
                                                        fontweight: FontWeight.bold,
                                                        color: customColors.warning
                                                    ),
                                                ),
                                            ],
                                        ),
                                    ),
                                ),
                                SliverToBoxAdapter(
                                    child: Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                                        child: Divider(color: Color.fromRGBO(0, 0, 0, 0.2)),
                                    ),
                                ),
                                SliverToBoxAdapter(
                                    child: GestureDetector(
                                        child: Container(
                                            height: 50.h,
                                            alignment: Alignment.center,
                                            margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                                            decoration: BoxDecoration(
                                                color: customColors.danger,
                                                borderRadius: BorderRadius.circular(20.r)
                                            ),
                                            child: Text(
                                                "Buyurtma berish",
                                                style: AppTextStyle.customMontserrat(
                                                    color: customColors.white,
                                                    fontweight: FontWeight.w600
                                                ),
                                            ),
                                        ),
                                    ),
                                ),
                            ],
                        ),
                );
            },
        );
    }
}
