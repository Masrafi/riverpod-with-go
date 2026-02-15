import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SenderPage extends StatelessWidget {
  const SenderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final listData = ['Apple', 'Banana', 'Orange'];
    final mapData = {'role': 'admin', 'active': true};
    final stringData = 'Hello from Sender Page';

    return Scaffold(
      appBar: AppBar(title: const Text('Sender Page')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.push(
              '/receive',
              extra: {
                'text': stringData,
                'list': listData,
                'map': mapData,
              },
            );
          },
          child: const Text('Send Data to Next Screen'),
        ),
      ),
    );
  }
}
