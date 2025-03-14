
import 'dart:ui';

import 'package:chaqchuq/app/pages/application/bloc/application_bloc.dart';

import 'package:chaqchuq/app/pages/application/bloc/application_state.dart';
import 'package:chaqchuq/app/pages/application/widgets/bottomnavigationbar.dart';
import 'package:chaqchuq/app/pages/application/widgets/widgets.dart';

import 'package:chaqchuq/app/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';




class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
    bool isloader = false;

    @override
    void initState() {
        super.initState();
        Future.delayed(
            Duration(seconds: 1), 
            (){ 
                setState(() {
                    isloader = true;
                });
            }
        );
    }


    @override
    Widget build(BuildContext context) {
        final customColors = Theme.of(context).extension<CustomColors>()!;
        return BlocBuilder<ApplicationBloc, ApplicationState>(
            builder: (context, state) {
                return Stack(
                    children: [
                        Positioned.fill(
                            child: Image.asset(
                                "assets/images/background2.jpeg",
                                fit: BoxFit.cover,
                            ),
                        ),
                        Positioned.fill(
                            child: BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                child: Container(
                                    color: Color.fromRGBO(255, 255, 255, 0.8),
                                ),
                            )
                        ),
                        isloader 
                            ? Scaffold(
                                backgroundColor: Colors.transparent,
                                body: Center(
                                    child: buildPage(state.index),
                                ),
                                bottomNavigationBar: CustomBottomNavigationBar(customColors: customColors),
                            )
                        :   Positioned.fill(
                                child: loader2(),
                            )
                    ],
                );
            },
        );
    }
}
