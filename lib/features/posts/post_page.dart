import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'post_provider.dart';
import 'package:go_router/go_router.dart';

class PostPage extends ConsumerWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postAsync = ref.watch(postProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Posts'), backgroundColor: Colors.purple,),
      body: postAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text(e.toString())),
        data: (posts) => ListView.builder(
          itemCount: 10,
          itemBuilder: (_, index) {
            return ListTile(
              title: Text(posts[index].title),
              onTap: () {
                context.push('/users');
              },
            );
          },
        ),
      ),
    );
  }
}
