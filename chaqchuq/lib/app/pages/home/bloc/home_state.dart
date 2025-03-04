





import 'package:chaqchuq/app/model/category.dart';
import 'package:chaqchuq/app/model/products.dart';

class HomeState {
    final List<CategoryModel> categoryList;
    final List<ProductsModel> productsList;
    HomeState({required this.categoryList, required this.productsList});


    HomeState copyWith({
        List<CategoryModel>? categoryList,
        List<ProductsModel>? productsList,
    }) {
        return HomeState(
            categoryList: categoryList ?? this.categoryList,
            productsList: productsList ?? this.productsList,
        );
    }
}


