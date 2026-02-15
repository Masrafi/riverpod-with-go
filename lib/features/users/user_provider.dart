import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dio/dio.dart';
import '../../core/dio_provider.dart';
import 'user_model.dart';

part 'user_provider.g.dart';

@riverpod
Future<List<User>> user(UserRef ref) async {
  final dio = ref.read(dioProvider);
  final response = await dio.get('/users');
  return (response.data as List).map((e) => User.fromJson(e)).toList();
}