import 'package:bloc_cubit/cubit/post_fetch_cubit.dart';
import 'package:bloc_cubit/repository/api_repository.dart';
import 'package:bloc_cubit/screens/home_page.dart';
import 'package:bloc_cubit/service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp(apiService: ApiService()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.apiService});

  final ApiService apiService;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PostFetchCubit>(
            create: (context) => PostFetchCubit(
                apiRepository: ApiRepository(apiService: apiService))
              ..fetchPostApi())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(primaryColor: Colors.blue),
        home: HomePage(),
      ),
    );
  }
}
