import 'package:freezed_annotation/freezed_annotation.dart';
part 'post_model.freezed.dart';
part 'post_model.g.dart';

@freezed
class Post with _$Post {
  const factory Post({
    required int userId,
    required int id,
    required String title,
    required String body,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}

/// Without JSON Serialization and Freezed and riverpod_generator, this model is perfect
//class Post {
//   final int id;
//   final String title;
//
//   Post({
//     required this.id,
//     required this.title,
//   });
//
//   factory Post.fromJson(Map<String, dynamic> json) {
//     return Post(
//       id: json['id'],
//       title: json['title'],
//     );
//   }
// }