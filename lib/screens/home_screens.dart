import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_cubit/model/post_model.dart';
import '../cubits/post_fetch_cubit.dart';

class HomeScreens extends StatefulWidget {
  const HomeScreens({Key? key}) : super(key: key);

  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("API data fetch Using Cubit"),
        centerTitle: true,
      ),
      body:  Center(
        child: BlocBuilder<PostFetchCubit,PostFetchState>(
          builder: (context,state)
          {
            if(state is PostFetchLoading){
              return CircularProgressIndicator();
            }
            else if(state is PostFetchError){
              return Text(state.failure.message,style: TextStyle(fontSize: 30.0),);
            }
            else if(state is PostFetchLoaded){
              final postList = state.postList;
              return postList.isEmpty ? Text("Error is Here",style: TextStyle(fontSize: 20.0),) : ListView.builder(
                itemCount: postList.length,
                itemBuilder: (context , index){
                  final Post singlePost = postList[index];
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text(singlePost.id.toString()),
                    ),
                    title: Text(singlePost.title,style: TextStyle(fontSize: 15),),
                    subtitle: Text(singlePost.body),
                  );
                },
              );
            }

            return Text("Error Occured Here",style: TextStyle(fontSize: 20.0),);
          }
        ),
      ),
    );
  }
}
