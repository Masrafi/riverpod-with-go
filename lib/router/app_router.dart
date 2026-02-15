import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_with_go/features/data_pass_example/receiver_screen.dart';
import 'package:riverpod_with_go/features/data_pass_example/sender_screen.dart';
import 'package:riverpod_with_go/features/post_watch_refresh/post_watch.dart';
import '../features/posts/post_page.dart';
import '../features/users/user_page.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const PostPage(),
      ),
      GoRoute(
        path: '/users',
        builder: (context, state) => const UserPage(),
      ),
      GoRoute(
        path: '/watch',
        builder: (context, state) => const PostPageWatch(),
      ),

      /// Data pass example
      GoRoute(
        path: '/send',
        builder: (context, state) => const SenderPage(),
      ),
      GoRoute(
        path: '/receive',
        builder: (context, state) {
          final data = state.extra as Map<String, dynamic>;
          return ReceiverPage(data: data);
        },
      ),
    ],
  );
});