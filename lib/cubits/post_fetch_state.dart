part of 'post_fetch_cubit.dart';

abstract class PostFetchState extends Equatable {
  const PostFetchState();
  @override
  List<Object> get props => [];
}

class PostFetchInitial extends PostFetchState {
  @override
  List<Object> get props => [];
}


class PostFetchLoading extends PostFetchState {
  @override
  List<Object> get props => [];
}

class PostFetchLoaded extends PostFetchState {
  final List<Post> postList;
  PostFetchLoaded({required this.postList});

  @override
  List<Object> get props => [postList];
}


class PostFetchError extends PostFetchState {
  final Failure failure;
  PostFetchError({required this.failure});

  @override
  List<Object> get props => [failure];
}
