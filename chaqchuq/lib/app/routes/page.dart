





import 'package:chaqchuq/app/bloc/app_bloc.dart';
import 'package:chaqchuq/app/global/app_global.dart';
import 'package:chaqchuq/app/pages/address/bloc/address_bloc.dart';
import 'package:chaqchuq/app/pages/application/application_page.dart';
import 'package:chaqchuq/app/pages/application/bloc/application_bloc.dart';
import 'package:chaqchuq/app/pages/bag/bloc/bag_bloc.dart';
import 'package:chaqchuq/app/pages/home/bloc/home_bloc.dart';
import 'package:chaqchuq/app/pages/home/home_page.dart';
import 'package:chaqchuq/app/pages/orders/bloc/orders_bloc.dart';
import 'package:chaqchuq/app/pages/productDetail/bloc/product_detail_bloc.dart';
import 'package:chaqchuq/app/pages/productDetail/product_detail_page.dart';
import 'package:chaqchuq/app/pages/welcome/bloc/welcome_bloc.dart';
import 'package:chaqchuq/app/pages/welcome/welcome_screen.dart';
import 'package:chaqchuq/app/routes/name.dart';
import 'package:chaqchuq/app/utils/contants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AppPages {
    static List<PageEntity> routes(){
        return [
            PageEntity(
                route: AppRoutes.INITIAL,
                page: WelcomeScreen(),
                bloc: BlocProvider(create: (_)=> WelcomeBloc())
            ),
            PageEntity(
                route: AppRoutes.APPLICATION,
                page:  ApplicationPage(),
                bloc: BlocProvider(create: (_)=> ApplicationBloc())
            ),
            PageEntity(
                route: AppRoutes.HOME,
                page:  HomePage(),
                bloc: BlocProvider(create: (_)=> HomeBloc())
            ),
            PageEntity(
                route: AppRoutes.PRODUCT_DETAIL,
                page:  ProductDetailPage(),
                bloc: BlocProvider(create: (_)=> ProductDetailBloc(homeBloc: BlocProvider.of<HomeBloc>(_)))
            ),
        ];
    }


    static List<dynamic> allBlocProviders(BuildContext context) {
        List<dynamic> blocProviders = <dynamic> [];
        for (var bloc in routes()) {
            if (bloc.bloc !=null) {
                blocProviders.add(bloc.bloc); 
            }
        }
        blocProviders.add(
            BlocProvider(create: (_)=> AppBloc())
        ); 
        blocProviders.add(
            BlocProvider(create: (_)=> OrdersBloc())
        ); 
        blocProviders.add(
            BlocProvider(create: (_)=> MyAddressBloc())
        );
        blocProviders.add(
            BlocProvider(create: (_)=> BagBloc(homeBloc: BlocProvider.of<HomeBloc>(_)))
        ); 
        return blocProviders;

    }

    static MaterialPageRoute GenerateRouteSettings (RouteSettings   settings) {
        if (settings.name != null) {
            var result = routes().where((element) => element.route == settings.name);
            if (result.isNotEmpty) {
                bool device_open =  Global.storageService.getBool(AppConstants.DEVICE_FIRST_OPEN);
                if (device_open){
                    return MaterialPageRoute(builder: (_) => ApplicationPage(), settings: settings);
                }
                return MaterialPageRoute(builder: (_) => result.first.page!, settings: settings);
            }
        }
        return MaterialPageRoute(builder: (_) => ApplicationPage(), settings: settings);
    }
}



class PageEntity {
    String? route;
    Widget? page;
    dynamic bloc;

    PageEntity({ required this.route, required  this.page, this.bloc});
}