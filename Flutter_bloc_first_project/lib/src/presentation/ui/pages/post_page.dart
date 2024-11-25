import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_first_project/src/presentation/blocs/post_bloc.dart';
import 'package:flutter_bloc_first_project/src/presentation/blocs/post_event.dart';

import '../../blocs/post_state.dart';



class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PostBloc,PostState>(
        builder: (context,state){
          if(state is PostLoading) { return Center(child: CircularProgressIndicator());}
          else if(state is PostLoaded){
            return ListView.builder(
              itemCount: state.posts.length,
                itemBuilder: (context,index){
              return ListTile(
                title: Text(state.posts[index].title),
                subtitle: Text(state.posts[index].body),
              );
            });
          }else if(state is PostError){
            return Center(child: Text("error : ${state.error}"),);
          }else{
            return Center(child: Text("No Posts loaded"),);
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          context.read<PostBloc>().add(FetchPostEvent());
        },
        child: Icon(Icons.download),
      ),
    );
  }
}
