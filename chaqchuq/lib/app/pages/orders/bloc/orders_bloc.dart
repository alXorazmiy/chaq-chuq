import 'package:bloc/bloc.dart';
import 'package:chaqchuq/app/model/order.dart';
import 'package:chaqchuq/app/pages/orders/bloc/orders_event.dart';
import 'package:chaqchuq/app/pages/orders/bloc/orders_state.dart';


class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
    OrdersBloc() : super(
        OrdersState(orders: [
            Order(id: 1, date: DateTime(2025, 2, 12), status: "new", images: [
                "assets/products/bodom.png",
                "assets/products/mayiz.png",
            ]),
            Order(id: 1, date: DateTime(2025, 1, 12), status: "wait", images: [
                "assets/products/keshyu.png",
                "assets/products/mayiz.png",
                "assets/products/bodom.png",
            ]),
            Order(id: 1, date: DateTime(2024, 12, 28), status: "cancel", images: [
                "assets/products/bodom.png",
                "assets/products/keshyu.png",
            ]),
            Order(id: 1, date: DateTime(2024, 12, 12), status: "ready", images: [
                "assets/products/mayiz.png",
            ]),
            Order(id: 1, date: DateTime(2024, 10, 12), status: "finish", images: [
                "assets/products/bodom.png",
                "assets/products/mayiz.png",
                "assets/products/keshyu.png",
                "assets/products/bodom.png",
            ]),
        ])
    ) {}
}
