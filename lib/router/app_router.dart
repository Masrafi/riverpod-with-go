import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
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
      // GoRoute(
      //   path: '/refresh',
      //   builder: (context, state) => const PostPageRefresh(),
      // ),
    ],
  );
});