import 'package:bloc_cubit/service/api_service.dart';

import '../models/posts_model.dart';

class ApiRepository {
  final ApiService apiService;

  ApiRepository({required this.apiService});

  Future<List<Post>?> getPostList() async {
    final response = await apiService.getPostData();
    if (response != null) {
      final data = response.data as List<dynamic>;
      return data
          .map(
            (singePost) => Post.fromMap(singePost),
          )
          .toList();
    }
  }
}
