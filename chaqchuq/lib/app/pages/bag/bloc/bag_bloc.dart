import 'package:bloc/bloc.dart';
import 'package:chaqchuq/app/global/app_global.dart';
import 'package:chaqchuq/app/model/bag.dart';
import 'package:chaqchuq/app/pages/bag/bloc/bag_event.dart';
import 'package:chaqchuq/app/pages/bag/bloc/bag_state.dart';
import 'package:chaqchuq/app/pages/home/bloc/home_bloc.dart';
import 'package:chaqchuq/app/pages/home/bloc/home_event.dart';


class BagBloc extends Bloc<BagEvent, BagState> {
    final HomeBloc homeBloc;
    BagBloc({required this.homeBloc}) : super(BagState(bag_product_list: [])) {
        on<BagInitial>(_bagInitial);
        on<DeleteItemBag>(_bagDeleteItem);
        on<ProductIncrement>(_productIncrement);
        on<ProductDecrement>(_productDecrement);
    }
    void _bagInitial(BagInitial event, emit) async {
        List<BagModel> list = await Global.storageService.getBagList();
        emit(state.copyWith(bag_product_list: list));
    }


    void _bagDeleteItem(DeleteItemBag event, emit) async {
        final list = state.bag_product_list.where((product) => product.id != event.id).toList();
        emit(state.copyWith(bag_product_list: list));
        await Global.storageService.saveBagList(list);


        final updatedList = homeBloc.state.productsList.map((value) {
        if (value.id == event.id) {
            return value.copyWith(amount: 0);
        }
        return value;
        }).toList();
        homeBloc.add(UpdateProductsEvent(products: updatedList));
    }
    void _productIncrement(ProductIncrement event, emit) async {
        final list = state.bag_product_list.map((product) {
        
        if (product.id == event.id) {
            return product.copyWith(
                amount: product.amount + 0.5,
                totalPrice: (product.amount + 0.5) * product.price);
        }
        return product;
        }).toList();

        emit(state.copyWith(bag_product_list: list));

        final updatedList = homeBloc.state.productsList.map((value) {
        if (value.id == event.id) {
            return value.copyWith(amount: value.amount  + 0.5);
        }
        return value;
        }).toList();
        homeBloc.add(UpdateProductsEvent(products: updatedList));


        Global.storageService.saveBagList(list);
    }

    void _productDecrement(ProductDecrement event, emit) async {
        bool update_if = false;
        final list = state.bag_product_list.map((product) {
            if (product.id == event.id) {
                if (product.amount > 0.5) {
                    return product.copyWith(amount: product.amount - 0.5,totalPrice: (product.amount - 0.5) * product.price);
                } else {
                    return null;
                }
            }
            return product;
            }).where((order) => order != null).cast<BagModel>().toList();
        emit(state.copyWith(bag_product_list: list));
   
        final updatedList = homeBloc.state.productsList.map((value) {
        if (value.id == event.id) {
            if(value.amount > 0.5){
                return value.copyWith(amount: value.amount  - 0.5);
            }
            return value.copyWith(amount: 0);
        }
        return value;
        }).toList();
        homeBloc.add(UpdateProductsEvent(products: updatedList));
        
        Global.storageService.saveBagList(list);
    }

}
