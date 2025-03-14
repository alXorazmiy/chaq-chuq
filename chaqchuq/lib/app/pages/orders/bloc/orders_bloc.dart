import 'package:bloc/bloc.dart';
import 'package:chaqchuq/app/model/order.dart';
import 'package:chaqchuq/app/pages/orders/bloc/orders_event.dart';
import 'package:chaqchuq/app/pages/orders/bloc/orders_state.dart';


class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
    OrdersBloc() : super(
        OrdersState(orders: [
            Order(id: 1, date: DateTime(2025, 1, 12), status: "wait", images: [
                "assets/products/keshyu2.png",
                "assets/products/mayiz2.png",
                "assets/products/bodom2.png",
            ]),
            Order(id: 1, date: DateTime(2024, 12, 28), status: "cancel", images: [
                "assets/products/bodom2.png",
                "assets/products/keshyu2.png",
            ]),
            Order(id: 1, date: DateTime(2024, 12, 12), status: "ready", images: [
                "assets/products/mayiz2.png",
            ]),
            Order(id: 1, date: DateTime(2024, 10, 12), status: "finish", images: [
                "assets/products/bodom2.png",
                "assets/products/mayiz2.png",
                "assets/products/keshyu2.png",
                "assets/products/funduk.png",
            ]),
        ])
    ) {}
}
