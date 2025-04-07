enum FromWho { me, hers }

// Identidad atómica: La unidad más pequeña
class Message {
  final String text;
  final String? imageUrl;
  final FromWho fromWho;

  Message({required this.text, this.imageUrl, required this.fromWho});
}
