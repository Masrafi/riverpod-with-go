import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../core/dio_provider.dart';
import 'post_model.dart';
part 'post_provider.g.dart';

@riverpod
Future<List<Post>> post(PostRef ref) async {
  final dio = ref.read(dioProvider);
  final response = await dio.get('/posts');
  return (response.data as List).map((e) => Post.fromJson(e)).toList();
}
