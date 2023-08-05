import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_app/logic/cubit/product_state.dart';

import '../../data/model/product_list_model.dart';
import '../../data/repository/ProductRepository.dart';

class ProductCubit extends Cubit<ProductState>{
  ProductCubit() : super( ProductLoadingState()) {
    fetchProductList();
  }

  ProductRepository productRepository = ProductRepository();

  void fetchProductList() async {

    try {
      ProductList product = await productRepository.fetchProductList();
      emit(ProductLoadedState(product));
    }
    on DioException catch(ex) {
      if(ex.type == DioExceptionType.badResponse) {
        emit( ProductErrorState("Can't fetch posts, please check your internet connection!") );
      }
      else {
        emit( ProductErrorState(ex.type.toString()) );
      }
    }
  }

}

