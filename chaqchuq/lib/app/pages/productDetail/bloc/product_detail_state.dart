





import 'package:chaqchuq/app/model/products.dart';

class ProductDetailState {
    final ProductsModel product;
    ProductDetailState({required this.product});
    
    ProductDetailState copyWith({
        ProductsModel? product
    }) {
        return ProductDetailState(
            product: product ?? this.product
        );
    }
}


