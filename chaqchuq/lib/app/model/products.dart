






import 'package:flutter/material.dart';

class ProductsModel {
    final int id;
    final String image;
    final String name;
    final int price;
    final double amount;
    final bool isLike;
    final Color color;

    ProductsModel({
        this.id = 0, 
        this.image = "", 
        this.name = "",
        this.price = 0,
        this.amount = 0.5,
        this.isLike = false,
        this.color = const Color(0xffe18012),
    });
    ProductsModel copyWith({
        int? id,
        String? image,
        String? name,
        int? price,
        double? amount,
        bool? isLike,
        Color? color,
    }) {
        return ProductsModel(
            id: id ?? this.id, 
            image: image ?? this.image, 
            name: name ?? this.name,
            price: price ?? this.price,
            amount: amount ?? this.amount,
            isLike: isLike ?? this.isLike,
            color: color ?? this.color,
        );
    }

    Map<String, dynamic> toJson() {
        return {
            'id': id,
            'image': image,
            'name': name,
            'color': color,
        };
    }

    factory ProductsModel.fromJson(Map<String, dynamic> json) {
        return ProductsModel(
            id: json['id'] ?? 0, 
            image: json['image'] ?? "image",
            name: json['name'] ?? "",
            price: json['price'] ?? 0,
            amount: json['amount'] ?? 0.5,
            isLike: json['isLike'] ?? false,
            color: json['color'] ?? Color(0xffe18012),
        );
    }
}