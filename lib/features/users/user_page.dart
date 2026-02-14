import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'user_provider.dart';
import 'user_model.dart';

class UserPage extends ConsumerWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsync = ref.watch(userProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.refresh(userProvider),
          ),
        ],
      ),
      body: userAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text(e.toString())),
        data: (users) => RefreshIndicator(
          onRefresh: () async => ref.refresh(userProvider),
          child: ListView.builder(
            itemCount: users.length,
            itemBuilder: (_, index) => ListTile(
              title: Text(users[index].name),
              subtitle: Text(users[index].email),
            ),
          ),
        ),
      ),
    );
  }
}