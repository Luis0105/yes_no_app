import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class HerMessageBubble extends StatelessWidget {
  final Message message;
  const HerMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final time = DateFormat('hh:mm a').format(message.timestamp); // Hora real
    final date =
        DateFormat('dd MMM yyyy').format(message.timestamp); // Dia real

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Texto
        Container(
          decoration: BoxDecoration(
            color: colors.secondary,
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            message.text,
            style: const TextStyle(color: Colors.white),
          ),
        ),

        const SizedBox(height: 5),

        if (message.imageUrl != null) _ImageBubble(imageUrl: message.imageUrl!),

        const SizedBox(height: 5),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              time,
              style: const TextStyle(fontSize: 10, color: Colors.grey),
            ),
            const SizedBox(width: 5),
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

class _ImageBubble extends StatelessWidget {
  final String imageUrl;

  const _ImageBubble({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        imageUrl,
        width: size.width * 0.7,
        height: 150,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            width: size.width * 0.7,
            height: 150,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: const Text('Toji Fushiguro está enviando una imagen'),
          );
        },
      ),
    );
  }
}
