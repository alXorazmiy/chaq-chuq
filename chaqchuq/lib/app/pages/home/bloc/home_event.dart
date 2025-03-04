


import 'package:chaqchuq/app/model/products.dart';
import 'package:flutter/material.dart';

abstract class HomeEvent {}

class UpdateProductsEvent extends HomeEvent {
    final List<ProductsModel> products;
    UpdateProductsEvent({required this.products});
}


class AddProduct extends HomeEvent{
    final ProductsModel product;
    final BuildContext context;
    AddProduct({required this.product, required this.context});
}


