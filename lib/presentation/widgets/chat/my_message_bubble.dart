import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class MyMessageBubble extends StatelessWidget {
  final Message message;

  const MyMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final time = DateFormat('hh:mm a').format(message.timestamp); // Hora real

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // Burbuja de mensaje
        Container(
          decoration: BoxDecoration(
            color: colors.primary,
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            message.text,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              time,
              style: const TextStyle(fontSize: 10, color: Colors.grey),
            ),
            const SizedBox(width: 5),
            const Icon(
              Icons.done_all,
              size: 14,
              color: Colors.blue,
            ),
          ],
        ),
      ],
    );
  }
}
