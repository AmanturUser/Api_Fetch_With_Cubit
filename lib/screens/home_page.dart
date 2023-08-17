import 'package:bloc_cubit/cubit/post_fetch_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Api Fetch with cubit'),
      ),
      body: BlocBuilder<PostFetchCubit, PostFetchState>(
        builder: (context, state) {
          if(state is PostFetchLoading){
            return const CircularProgressIndicator();
          }else if(state is PostFetchError){
            return Text(state.failure.message);
          }else if(state is PostFetchLoaded){
            final postList=state.postList;
            return postList.isEmpty ? const Text('No any posts'):
            ListView.builder(itemBuilder: (context,index){
              final singlePost=postList[index];
              return ListTile(
                title: Text(singlePost.title),
                subtitle: Text(singlePost.body),
              );
            },
            itemCount: postList.length,);
          }
          return SizedBox();
        },
      ),
    );
  }
}
