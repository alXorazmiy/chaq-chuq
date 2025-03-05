import 'package:flutter/material.dart';

@immutable
class CustomColors extends ThemeExtension<CustomColors> {
    final Color backgroundColor;
    final Color textColor;
    final Color categoryBackgroundColor;
    final Color primary = Color(0xff2080F0);
    final Color danger;
    final Color success = Color(0xff1b9c85);
    final Color warning = Color(0xffe18012);
    final Color firstColor = Color(0xff059669);
    final Color white;

     CustomColors({
        required this.backgroundColor,
        required this.textColor,
        required this.categoryBackgroundColor,
        required this.white,
        required this.danger,
    });


    static  CustomColors light = CustomColors(
        backgroundColor: Color(0xFFFFFFFF),
        textColor: Color(0xFF000000), 
        categoryBackgroundColor: Color(0xffEEEEEE), 
        white: Color(0xffffffff), 
        danger: Color(0xffff0060),

    );

    static  CustomColors dark = CustomColors(
        backgroundColor: Color(0xFF181a1e), 
        textColor: Color(0xFFFFFFFF),
        categoryBackgroundColor: Color(0xFF202528),
        white: Color(0xFF202528), 
        danger: Color(0xFF202528), 
    );

    @override
    CustomColors copyWith({
        Color? backgroundColor, 
        Color? textColor, 
        Color? categoryBackgroundColor, 
        Color? white,
        Color? danger,
    }) {
        return CustomColors(
        backgroundColor: backgroundColor ?? this.backgroundColor,
        textColor: textColor ?? this.textColor,
        categoryBackgroundColor: categoryBackgroundColor ?? this.categoryBackgroundColor,
        white: white ?? this.white,
        danger: danger ?? this.danger,
        );
    }

    @override
    ThemeExtension<CustomColors> lerp(ThemeExtension<CustomColors>? other, double t) {
        if (other is! CustomColors) return this;
        return CustomColors(
            backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
            textColor: Color.lerp(textColor, other.textColor, t)!,
            categoryBackgroundColor: Color.lerp(categoryBackgroundColor, other.categoryBackgroundColor, t)!,
            white: Color.lerp(white, other.white, t)!,
            danger: Color.lerp(danger, other.danger, t)!,
      );
    } 
}
