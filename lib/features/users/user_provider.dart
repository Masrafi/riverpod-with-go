import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/dio_provider.dart';
import 'user_model.dart';

final userProvider = FutureProvider<List<User>>((ref) async {
  final dio = ref.read(dioProvider);

  final response = await dio.get('/users');

  return (response.data as List)
      .map((e) => User.fromJson(e))
      .toList();
});