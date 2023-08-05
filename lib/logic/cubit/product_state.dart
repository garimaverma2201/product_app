import '../../data/model/product_list_model.dart';

abstract class ProductState {}

class ProductLoadingState extends ProductState {}

class ProductLoadedState extends ProductState {
  final ProductList productsList;
  ProductLoadedState(this.productsList);
}

class ProductErrorState extends ProductState {
  final String error;
  ProductErrorState(this.error);
}