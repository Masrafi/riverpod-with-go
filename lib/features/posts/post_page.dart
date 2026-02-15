import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'post_provider.dart';

class PostPage extends ConsumerWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postAsync = ref.watch(postProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.refresh(postProvider),
          ),
        ],
      ),
      body: postAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text(e.toString())),
        data: (posts) => RefreshIndicator(
          onRefresh: () async => ref.refresh(postProvider),
          child: ListView.builder(
            itemCount: posts.length,
            itemBuilder: (_, index) => ListTile(
              title: Text(posts[index].title),
              onTap: () => context.push('/users'),
            ),
          ),
        ),
      ),
    );
  }
}
