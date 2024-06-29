import 'package:dio/dio.dart';
import 'package:ecom_app/networking/api_endpoints.dart';

class DioClients{
  final Dio _dio= Dio();

  DioClients(){

 _dio.options
 ..baseUrl=ApiEndpoints.BaseUrl
//  ..connectTimeout =const Duration(seconds: 20)
//  ..receiveTimeout= const Duration(seconds: 20)
 ..headers={
'Content-Type': 'application/json',
 };   
  
  }

  Future<Response> get(String endPoints) async{
   try{
    final response= await _dio.get(endPoints);
    return response;
   }on DioException catch(e){
    return Future.error(e);
   }
  }

 Future <Response> post(String endPoints ,dynamic data) async{
  try{
    final response=await _dio.post(endPoints, data: data);
    return response;
  }on DioException catch(e){
    return Future.error(e);
  }
 }
}