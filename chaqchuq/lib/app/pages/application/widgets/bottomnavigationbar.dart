





import 'package:chaqchuq/app/pages/application/bloc/application_bloc.dart';
import 'package:chaqchuq/app/pages/application/bloc/application_event.dart';
import 'package:chaqchuq/app/pages/application/bloc/application_state.dart';
import 'package:chaqchuq/app/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomNavigationBar extends StatelessWidget {
    const CustomBottomNavigationBar({
        super.key,
        required this.customColors,
    });

    final CustomColors customColors;

    @override
    Widget build(BuildContext context) {
    return Container(
        width: 375.w,
        height: 58.h,
        child: Theme(
            data: ThemeData(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                splashFactory: NoSplash.splashFactory, 
            ),
            child: BlocBuilder<ApplicationBloc, ApplicationState>(
                builder: (context, state) {
                return BottomNavigationBar(
                    // enableFeedback: false,
                    showSelectedLabels: true,
                    currentIndex: state.index,
                    elevation: 0,
                    type: BottomNavigationBarType.fixed,
                    backgroundColor: customColors.backgroundColor,
                    selectedLabelStyle: TextStyle(
                            fontSize: 12.sp,
                            color: customColors.danger,
                            fontFamily: "Poppins"
                        ),
                        unselectedLabelStyle: TextStyle(
                            fontSize: 12.sp,
                            color: customColors.textColor,
                            fontFamily: "Poppins" 
                        ),
                    onTap: (value) {
                        context.read<ApplicationBloc>().add(TriggerApplicationEvent(value));
                    },
                    items: [
                        BottomNavigationBarItem(
                            label: "Bosh sahifa",
                            icon: SizedBox(
                                width: 20.w,
                                height: 20.h,
                                child: Image.asset("assets/icons/home.png", color: customColors.textColor.withOpacity(0.6)),
                            ),
                            activeIcon: SizedBox(
                                width: 20.w,
                                height: 20.h,
                                child: Image.asset("assets/icons/home.png", color: customColors.danger),
                            )
                        ),
                        BottomNavigationBarItem(
                            label: "Buyurtmalar",
                            icon: SizedBox(
                                width: 20.w,
                                height: 20.h,
                                child: Image.asset("assets/icons/list.png", color: customColors.textColor.withOpacity(0.6)),
                            ),
                            activeIcon: SizedBox(
                                width: 20.w,
                                height: 20.h,
                                child: Image.asset("assets/icons/list.png", color: customColors.danger),
                            )
                        ),
                        BottomNavigationBarItem(
                            label: "Savatcha",
                            icon: SizedBox(
                                width: 20.w,
                                height: 20.h,
                                child: Image.asset("assets/icons/shopbag.png", color: customColors.textColor.withOpacity(0.6)),
                            ),
                            activeIcon: SizedBox(
                                width: 20.w,
                                height: 20.h,
                                child: Image.asset("assets/icons/shopbag.png", color: customColors.danger),
                            )
                        ),
                        BottomNavigationBarItem(
                            label: "Shaxsiy",
                            icon: SizedBox(
                                width: 20.w,
                                height: 20.h,
                                child: Image.asset("assets/icons/person.png", color: customColors.textColor.withOpacity(0.6)),
                            ),
                            activeIcon: SizedBox(
                                width: 20.w,
                                height: 20.h,
                                child: Image.asset("assets/icons/person.png", color: customColors.danger),
                            )
                        ),
                    ],
                );
                }
            ),
            ),
        );
    }
}
