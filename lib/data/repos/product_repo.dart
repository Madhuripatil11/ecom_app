import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:ecom_app/data/models/category.dart';
import 'package:ecom_app/networking/api_endpoints.dart';
import 'package:ecom_app/networking/dio_clients.dart';
import 'package:ecom_app/data/models/products.dart';


//DRY DONOT REPEAT YOURSELF
class ProductRepo{
  final DioClients _dioClients=DioClients();

  Future <List <Products>> getProducts(String? slug) async{
    List<Products> productsList=[];
     Response response;
     if(slug!=null){
      response=await _dioClients.get('${ApiEndpoints.GetProductsByCategoryEndPoint}/$slug');

     }else{
     response=await _dioClients.get(ApiEndpoints.GetProductsEndPoint);
     }
    //  log(response.data.toString());

     if(response.statusCode==200){
      productsList=response.data['products']
      .map<Products>((product) => Products.fromJson(product)).toList();
      // log(productsList.length.toString());
      return productsList;
     }else{
      log('Failed to get products');
      return Future.error('Failed to get products');
     }
  }

  Future <Products> getProductFromId({required String productid}) async{

  final response= await _dioClients.get('${ApiEndpoints.GetProductsEndPoint}/$productid');
  // log(response.data.toString());
  if(response.statusCode==200)
  {
      final product= Products.fromJson(response.data);
      return product;
  }else{
    log('Failed to get products');
    return Future.error('Failed to get products');

  }
  }

  Future <List<CategoryModel>> getCategoryList() async{
    final response= await _dioClients.get(ApiEndpoints.GetAllCategoriesEndPoint);
    // log(response.data.toString());
    if(response.statusCode==200)
    {
      final categoriesList=response.data.map<CategoryModel>((category) => 
      CategoryModel.fromJson(category)).toList();
      // log(categoriesList.length.toString());
      return categoriesList;
    }else{
      log('Failed to get products');
    return Future.error('Failed to get products');
    }
  }

    Future <List<Products>> getProductsByCategory( String categoryName) async{
    List<Products> productsList=[];
    final response= await _dioClients.get('${ApiEndpoints.GetProductsByCategoryEndPoint}/$categoryName');
    // log(response.data.toString());
    if(response.statusCode==200)
    {
       productsList=response.data['products']
      .map<Products>((product) => Products.fromJson(product)).toList();
      log(productsList.length.toString());
      return productsList;
    }else{
      log('Failed to get products');
    return Future.error('Failed to get products');
    }
  }
}