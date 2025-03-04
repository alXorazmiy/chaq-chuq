import 'package:bloc/bloc.dart';
import 'package:chaqchuq/app/global/app_global.dart';
import 'package:chaqchuq/app/model/bag.dart';
import 'package:chaqchuq/app/model/products.dart';
import 'package:chaqchuq/app/pages/bag/bloc/bag_bloc.dart';
import 'package:chaqchuq/app/pages/bag/bloc/bag_event.dart';
import 'package:chaqchuq/app/pages/home/bloc/home_bloc.dart';
import 'package:chaqchuq/app/pages/home/bloc/home_event.dart';

import 'package:chaqchuq/app/pages/productDetail/bloc/product_detail_event.dart';
import 'package:chaqchuq/app/pages/productDetail/bloc/product_detail_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
    final HomeBloc homeBloc;
    ProductDetailBloc({required this.homeBloc}) : super(ProductDetailState(product: ProductsModel())) {
        on<InitialProduct>(_initialProduct);
        on<IncrementProduct>(_incrementProduct);
        on<DecrementProduct>(_decremeentProduct);
        on<IsLike>(_isLike);
        on<AddBag>(_addBag);
    }
    void _initialProduct(InitialProduct event, emit) async {
        emit(
            state.copyWith(
                product: state.product.copyWith(
                    id: event.product.id,
                    image: event.product.image,
                    name: event.product.name,
                    amount: event.product.amount == 0 ? 0.5: event.product.amount,
                    price: event.product.price,
                    isLike: event.product.isLike,
                )
            )
        );
    }

    void _incrementProduct(IncrementProduct event, emit) async {
        emit(
            state.copyWith(
                product: state.product.copyWith(
                    amount: state.product.amount + 0.5
                )
            )
        );
    }
    void _decremeentProduct(DecrementProduct event, emit) async {
        if(state.product.amount == 0.5) {
            return;
        } else {
            emit(
                state.copyWith(
                    product: state.product.copyWith(
                        amount: state.product.amount - 0.5
                    )
                )
            );
        }
    }

    void _isLike(IsLike event, emit) async {
        if(state.product.isLike) {
            emit(
                state.copyWith(product: state.product.copyWith(isLike: false))
            );
        } else {
            emit(
                state.copyWith(product: state.product.copyWith(isLike: true))
            );
        }
    }
    void _addBag(AddBag event, emit) async {

        List<BagModel> list = await Global.storageService.getBagList();
        for(var value in list) {
            if(value.id == state.product.id) {
                return;
            }
        }
        list.add(
            BagModel(
                id: state.product.id, 
                name: state.product.name, 
                image: state.product.image, 
                amount: state.product.amount, 
                price: state.product.price, 
                totalPrice: state.product.amount * state.product.price
            )
        );
        event.context.read<BagBloc>().add(BagInitial());



        final updatedList = homeBloc.state.productsList.map((value) {
        if (value.id == state.product.id) {
            return value.copyWith(amount: state.product.amount);
        }
        return value;
        }).toList();

        homeBloc.add(UpdateProductsEvent(products: updatedList));
        Global.storageService.saveBagList(list);

    }
}
