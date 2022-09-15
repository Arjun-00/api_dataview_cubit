
import 'package:dio/dio.dart';
import 'package:todo_cubit/constraint/api_constant.dart';

class ApiService{

  final Dio _dio = Dio();

  Future<Response ?> getPostData() async{
    try{
      final Response? response = await _dio.get("$baseUrl/$posts");
      return response;
    }catch (ee){
      print("Error : $ee");
    }
  }
}