
import 'package:todo_cubit/model/post_model.dart';
import 'package:todo_cubit/service/api_service.dart';

class ApiRepository{
  final ApiService apiService;

  ApiRepository({required this.apiService});

  Future<List<Post>?> getPostList() async{
    final responce = await apiService.getPostData();
    if(responce != null){
      final data = responce.data as List<dynamic>;
      return data.map((e) => Post.fromMap(e)).toList();
    }
  }
}