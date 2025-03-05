import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:chaqchuq/app/global/app_global.dart';
import 'package:chaqchuq/app/model/bag.dart';
import 'package:chaqchuq/app/model/products.dart';
import 'package:chaqchuq/app/pages/bag/bloc/bag_bloc.dart';
import 'package:chaqchuq/app/pages/bag/bloc/bag_event.dart';
import 'package:chaqchuq/app/pages/home/bloc/home_event.dart';
import 'package:chaqchuq/app/pages/home/bloc/home_state.dart';
import 'package:chaqchuq/app/model/category.dart';
import 'package:flutter_bloc/flutter_bloc.dart';






class HomeBloc extends Bloc<HomeEvent, HomeState> {
    HomeBloc() : super(
        HomeState(
            categoryList: [
                CategoryModel(id: 1, image: "assets/images/cashews.png", name: "Keshyu yong'oqi"),
                CategoryModel(id: 2, image: "assets/images/filberts.png", name: "Funduk"),
                CategoryModel(id: 3, image: "assets/images/pistachio.png", name: "Handon Pista"),
                CategoryModel(id: 4, image: "assets/images/walnuts.png", name: "Yong'oq"),
                CategoryModel(id: 5, image: "assets/images/bodom.png", name: "Bodom"),
                // CategoryModel(id: 6, image: "assets/images/vafli.png", name: "Vafli"),
                CategoryModel(id: 7, image: "assets/images/yeryongoq.png", name: "Yer yong'oqi"),
                // CategoryModel(id: 8, image: "assets/images/shirinlik.png", name: "Shirinlik"),
                CategoryModel(id: 9, image: "assets/images/danak.png", name: "Danak"),
                CategoryModel(id: 10, image: "assets/images/shurdanak.png", name: "Sho'r Danak"),
                CategoryModel(id: 11, image: "assets/images/turshak.png", name: "Turshak"),
                CategoryModel(id: 12, image: "assets/images/mayiz.png", name: "Mayiz"),
            ],
            productsList: [
                ProductsModel(id: 1, image: "assets/products/keshyu2.png", name: "Keshyu yong'oqi", price: 35000, amount: 0, isLike: false, color: Color(0xffdbba77)),
                ProductsModel(id: 2, image: "assets/products/bodom2.png", name: "Bodom", price: 45000, amount: 0, isLike: true, color: Color(0xffe18012)),
                ProductsModel(id: 3, image: "assets/products/mayiz2.png", name: "Mayiz", price: 23000, amount: 0, isLike: true, color: Color(0xff28292e)),
                ProductsModel(id: 4, image: "assets/products/sariqmayiz2.png", name: "Sariq Mayiz", price: 25000, amount: 0, isLike: false),
                ProductsModel(id: 5, image: "assets/images/turshak.png", name: "Turshak", price: 44000, amount: 0, isLike: false, color: Color(0xffe65a03)),
                ProductsModel(id: 6, image: "assets/products/funduk.png", name: "Funduk", price: 35000, amount: 0, isLike: true, color: Color(0xffc59084)),
                ProductsModel(id: 7, image: "assets/products/pista.png", name: "Handon Pista", price: 45000, amount: 0, isLike: false, color: Color(0xff5b8217)),
                // ProductsModel(id: 8, image: "assets/products/saqirmayiz.png", name: "Sariq Mayiz", price: 25000, amount: 0, isLike: false),
                // ProductsModel(id: 9, image: "assets/products/saqirmayiz.png", name: "Sariq Mayiz", price: 25000, amount: 0, isLike: false),
                // ProductsModel(id: 10, image: "assets/products/saqirmayiz.png", name: "Sariq Mayiz", price: 25000, amount: 0, isLike: false),
            ]
        )
    ){
        on<UpdateProductsEvent>(_updateProducts);
        on<AddProduct>(_addProduct);
    }
    void _updateProducts(UpdateProductsEvent event, emit) async {
        emit(
            state.copyWith(productsList: event.products)
        );
    }
    void _addProduct(AddProduct event, emit) async {
       
        List<BagModel> list = await Global.storageService.getBagList();
       
        list.add(
            BagModel(
                id: event.product.id, 
                name: event.product.name, 
                image: event.product.image, 
                amount: 0.5, 
                price: event.product.price, 
                totalPrice: event.product.amount * event.product.price
            )
        );
        final updatedList = state.productsList.map((value) {
        if (value.id == event.product.id) {
            return value.copyWith(amount: 0.5);
        }
        return value;
        }).toList();
        
        emit(state.copyWith(productsList: updatedList));
        Global.storageService.saveBagList(list);
        event.context.read<BagBloc>().add(BagInitial());
    }
}
