






class ProductsModel {
    final int id;
    final String image;
    final String name;
    final int price;
    final double amount;
    final bool isLike;

    ProductsModel({
        this.id = 0, 
        this.image = "", 
        this.name = "",
        this.price = 0,
        this.amount = 0.5,
        this.isLike = false,
    });
    ProductsModel copyWith({
        int? id,
        String? image,
        String? name,
        int? price,
        double? amount,
        bool? isLike,
    }) {
        return ProductsModel(
            id: id ?? this.id, 
            image: image ?? this.image, 
            name: name ?? this.name,
            price: price ?? this.price,
            amount: amount ?? this.amount,
            isLike: isLike ?? this.isLike,
        );
    }

    Map<String, dynamic> toJson() {
        return {
            'id': id,
            'image': image,
            'name': name,
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
        );
    }
}