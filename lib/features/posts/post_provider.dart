import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/dio_provider.dart';
import 'post_model.dart';

final postProvider = FutureProvider<List<Post>>((ref) async {
  final dio = ref.read(dioProvider);
print("Post API call");
  final response = await dio.get('/posts');
print(response.data);
  return (response.data as List)
      .map((e) => Post.fromJson(e))
      .toList();
});