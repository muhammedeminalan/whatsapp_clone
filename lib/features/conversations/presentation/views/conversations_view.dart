import 'package:flutter/material.dart';
import '../../../../core/utils/extensions/content_extensions.dart';

class ConversationsView extends StatefulWidget {
  const ConversationsView({super.key});

  @override
  State<ConversationsView> createState() => _ConversationsViewState();
}

class _ConversationsViewState extends State<ConversationsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('sohpetler ')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Conversations View', style: context.headlineLarge),
          context.divider(),
          Text(
            'This is a sample conversation view.',
            style: context.bodyMedium,
          ),
        ],
      ),
    );
  }
}
