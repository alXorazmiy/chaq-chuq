



import 'package:chaqchuq/app/pages/address/address_page.dart';
import 'package:chaqchuq/app/pages/bag/bag_page.dart';
import 'package:chaqchuq/app/pages/home/home_page.dart';
import 'package:chaqchuq/app/pages/orders/orders_page.dart';
import 'package:chaqchuq/app/pages/profile/profile_page.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

Widget buildPage(int index) {
    List<Widget> _widget = [
        HomePage(),
        OrdersPage(),
        BagPage(),
        ProfilePage(),
    ];
    return _widget[index];
}



Widget loader() {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: RiveAnimation.asset("assets/riv/loader5.riv",  animations: ['Orbit square']),
        ),
    );
}


Widget loader2() {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: LoadingAnimationWidget.fourRotatingDots(
                color: const Color(0xFFEA3799),
                size: 40,
            ),
        ),  
    );
}