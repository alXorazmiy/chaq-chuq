



import 'package:chaqchuq/app/pages/bag/bag_page.dart';
import 'package:chaqchuq/app/pages/home/home_page.dart';
import 'package:chaqchuq/app/pages/orders/orders_page.dart';
import 'package:chaqchuq/app/pages/profile/profile_page.dart';

import 'package:flutter/material.dart';

Widget buildPage(int index) {
    List<Widget> _widget = [
        HomePage(),
        OrdersPage(),
        BagPage(),
        ProfilePage(),
    ];
    return _widget[index];
}