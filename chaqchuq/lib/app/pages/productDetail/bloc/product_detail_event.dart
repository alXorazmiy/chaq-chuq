


import 'package:chaqchuq/app/model/products.dart';
import 'package:flutter/material.dart';

abstract class ProductDetailEvent {}


class InitialProduct extends ProductDetailEvent{
    final ProductsModel product;
    InitialProduct({required this.product});
}


class IncrementProduct extends ProductDetailEvent{}
class DecrementProduct extends ProductDetailEvent{}
class IsLike extends ProductDetailEvent{}
class AddBag extends ProductDetailEvent{
    final BuildContext context;
    AddBag({required this.context});
}