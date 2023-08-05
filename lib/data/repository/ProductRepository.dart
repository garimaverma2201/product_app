import 'package:dio/dio.dart';
import 'package:product_app/data/repository/api/api.dart';
import 'package:product_app/data/model/product_list_model.dart';

import '../../utils/Constants.dart';

class ProductRepository {

  API api = API();

  Future<ProductList> fetchProductList() async {
    try{
     Response response =  await api.sendRequest.get(PRODUCT);
     return ProductList.fromJson(response.data);
    }catch(ex){
       throw ex;
    }
  }

}