 
 
 


import 'package:chaqchuq/app/model/bag.dart';

class BagState {
    final List<BagModel> bag_product_list;
    final double totalPrice;
    final double totalWeight;
    final double deliveryPrice = 4000;


    BagState({required this.bag_product_list})
        : totalPrice = bag_product_list.fold(0,
            (sum, order) => sum + (order.amount * order.price),
        ),totalWeight = bag_product_list.fold(
            0, (sum, order) => sum + order.amount,
        );


    BagState copyWith({
        List<BagModel>? bag_product_list,
    }) {
        return BagState(
            bag_product_list: bag_product_list ?? this.bag_product_list,
        );
    }
}


