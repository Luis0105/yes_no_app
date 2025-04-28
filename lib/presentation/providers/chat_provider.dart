import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  List<Message> messageList = [
    Message(text: "Hola Mike, ¿Listo para reprobar?", fromWho: FromWho.hers),
    Message(
        text: "Por haberte ido te vas a especial directo", fromWho: FromWho.me),
    Message(
        text: "Por haberte ido te vas a especial directo", fromWho: FromWho.me),
    Message(
        text: "Por haberte ido te vas a especial directo", fromWho: FromWho.me),
    Message(
        text: "Por haberte ido te vas a especial directo",
        fromWho: FromWho.hers)
  ];

  Future<void> sendMessage(String text) async {
    final newMessage = Message(text: text, fromWho: FromWho.me);
    // Agregar un nuevo mensaje a la lista
    messageList.add(newMessage);

    // Notificara a provider que algo cambió
    notifyListeners();
  }
}
