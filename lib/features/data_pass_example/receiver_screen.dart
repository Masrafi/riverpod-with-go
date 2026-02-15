import 'package:flutter/material.dart';

class ReceiverPage extends StatelessWidget {
  final Map<String, dynamic> data;

  const ReceiverPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final String text = data['text'];
    final List list = data['list'];
    final Map map = data['map'];

    return Scaffold(
      appBar: AppBar(title: const Text('Receiver Page')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('String: $text'),
            const SizedBox(height: 12),
            Text('List: ${list.join(', ')}'),
            const SizedBox(height: 12),
            Text('Map: $map'),
          ],
        ),
      ),
    );
  }
}
