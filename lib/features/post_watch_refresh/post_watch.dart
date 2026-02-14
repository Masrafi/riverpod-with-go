import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_with_go/features/posts/post_provider.dart';

class PostPageWatch extends ConsumerWidget {
  const PostPageWatch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postAsync = ref.watch(postProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Watch'), backgroundColor: Colors.purple,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: ()=> ref.refresh(postProvider) // ✅ CORRECT PLACE
          ),
        ],),
      body: postAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text(e.toString())),
        data: (posts) => ListView.builder(
          itemCount: 10,
          itemBuilder: (_, index) {
            return ListTile(
              title: Text(posts[index].title),
              onTap: () {
                context.push('/refresh');
              },
            );
          },
        ),
      ),
    );
  }
}
