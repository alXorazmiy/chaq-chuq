import 'package:chaqchuq/app/pages/bag/bloc/bag_bloc.dart';
import 'package:chaqchuq/app/pages/bag/bloc/bag_state.dart';
import 'package:chaqchuq/app/pages/orders/bloc/orders_bloc.dart';
import 'package:chaqchuq/app/pages/orders/bloc/orders_state.dart';
import 'package:chaqchuq/app/pages/orders/widgets/order_card.dart';
import 'package:chaqchuq/app/utils/colors/app_colors.dart';
import 'package:chaqchuq/app/utils/textstyle/app_textStyle.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bag/widgets/bag_product_card.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
    @override
    Widget build(BuildContext context) {
        final customColors = Theme.of(context).extension<CustomColors>()!;

        return BlocBuilder<OrdersBloc, OrdersState>(
        builder: (context, state) {
            return Scaffold(
            appBar: AppBar(
                backgroundColor: customColors.danger,
                surfaceTintColor: customColors.danger,
                title: Text(
                "order".tr(),
                style: AppTextStyle.customMontserrat(
                    fontweight: FontWeight.bold,
                    fontSize: 20.sp,
                    color: Colors.white),
                ),
                centerTitle: true,
            ),
            body: CustomScrollView(
                slivers: [
                SliverPadding(
                    padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
                    sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                        childCount: state.orders.length,
                        (BuildContext context, int index) {
                        return OrderCard(
                            customColors: customColors,
                            order: state.orders[index],
                        );
                        },
                    ),
                    ),
                ),
                SliverPadding(padding: EdgeInsets.only(top: 40.h)),
                ],
            ),
            );
        },
        );
    }
}
