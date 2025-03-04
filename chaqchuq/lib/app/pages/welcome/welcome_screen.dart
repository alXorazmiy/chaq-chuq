import 'package:chaqchuq/app/pages/welcome/bloc/welcome_bloc.dart';
import 'package:chaqchuq/app/pages/welcome/bloc/welcome_event.dart';
import 'package:chaqchuq/app/pages/welcome/bloc/welcome_state.dart';
import 'package:chaqchuq/app/pages/welcome/screens/language_screen.dart';
import 'package:chaqchuq/app/utils/colors/app_colors.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
    PageController pageController = PageController(initialPage:  0);
    @override
    Widget build(BuildContext context) {
        final customColors = Theme.of(context).extension<CustomColors>()!;

        return Container(
            // color: AppColors.primaryBackground,
            child: Scaffold(
                body: BlocBuilder<WelcomeBloc, WelcomeState>(
                    builder: (context, state) {
                        return  Stack(
                            alignment: Alignment.topCenter,
                            children: [
                            PageView(
                                controller: pageController,
                                onPageChanged: (index){
                                    state.page = index;
                                    BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent());
                                },
                                children: [
                                    LanguageScreen(),
                                ],
                            ),
                            // Positioned(
                            //     bottom: 100.h,
                            //     child: DotsIndicator(
                            //         dotsCount: 3,
                            //         position: state.page,
                            //         mainAxisAlignment: MainAxisAlignment.center,
                            //         decorator: DotsDecorator(
                            //             activeColor: customColors.primary,
                            //             size: const Size.square(8.0),
                            //             activeSize: const Size(16.0, 8.0),
                            //             activeShape: RoundedRectangleBorder(
                            //                 borderRadius: BorderRadius.circular(8.r))),
                            //         ),
                            //     )
                            ],
                    );
                },
            ),
        ),
    );
  }
}