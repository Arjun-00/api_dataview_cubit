import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../model/failer_model.dart';
import '../model/post_model.dart';
import '../repository/api_repository.dart';

part 'post_fetch_state.dart';

class PostFetchCubit extends Cubit<PostFetchState> {
  final ApiRepository apiRepository;
  PostFetchCubit({required this.apiRepository}) : super(PostFetchInitial());

  Future<void> fetchPostApiData() async{
    emit(PostFetchLoading());
    try{
      final List<Post>? postList = await apiRepository.getPostList();
      emit(PostFetchLoaded(postList: postList ?? []));
    } on Failure catch(err){
      emit(PostFetchError(failure: err));
    }
    catch(e){
      print("Error : $e");
    }
  }

}
