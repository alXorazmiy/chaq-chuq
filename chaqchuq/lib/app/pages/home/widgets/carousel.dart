



import 'package:carousel_slider/carousel_slider.dart';
import 'package:chaqchuq/app/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Carousel extends StatelessWidget {
  const Carousel({
    super.key,
    required this.customColors,
  });

  final CustomColors customColors;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 160.h,
        child: CarouselSlider(
            options: CarouselOptions(height: 140.h, autoPlay: true),
            items: [1,2,3,4].map((i) {
                return Builder(
                    builder: (BuildContext context) {
                        return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 8.w),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.r),
                                boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.2),
                                        spreadRadius: 2, 
                                        blurRadius: 5, 
                                        offset: Offset(0, 2),
                                    ),
                                    ],
                            ),
                            child: Image.asset("assets/images/${i}.png",)
                        );
                    },
                );
            }).toList(),
        ),
    );
  }
}
