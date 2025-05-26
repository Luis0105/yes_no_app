import 'dart:math';

import 'package:yes_no_app/domain/entities/message.dart';

class YesNoModel {
  final String answer;
  final bool forced;
  final String image;

  YesNoModel({
    required this.answer,
    required this.forced,
    required this.image,
  });

  factory YesNoModel.fromJsonMap(Map<String, dynamic> json) => YesNoModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
      );

  Message toMessageEntity() {
    final random = Random();

    final text = answer == 'yes'
        ? (random.nextBool() ? 'Sí' : 'Tal vez')
        : answer == 'no'
            ? (random.nextBool() ? 'No' : 'Probablemente')
            : 'Tal vez';

    return Message(
        text: text,
        fromWho: FromWho.hers,
        imageUrl: image,
        timestamp: DateTime.now());
  }
}
