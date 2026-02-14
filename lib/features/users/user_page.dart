import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'user_provider.dart';

class UserPage extends ConsumerWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsync = ref.watch(userProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Users'), backgroundColor: Colors.purple,),
      body: userAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text(e.toString())),
        data: (users) => ListView.builder(
          itemCount: users.length,
          itemBuilder: (_, index) {
            return ListTile(
              title: Text(users[index].name),
              onTap: () {
                context.push('/watch');
              },
            );
          },
        ),
      ),
    );
  }
}