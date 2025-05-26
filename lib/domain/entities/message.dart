enum FromWho { me, hers }

// Identidad atómica: La unidad más pequeña
class Message {
  final String text;
  final String? imageUrl;
  final FromWho fromWho;
  final DateTime timestamp; // Función para detectar hora

  Message({
    required this.text,
    this.imageUrl,
    required this.fromWho,
    required this.timestamp,
  });
}
