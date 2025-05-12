import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  // Controlador que maneja la posición del scroll
  final ScrollController chatScrollController = ScrollController();
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
    if (text.trim().isEmpty) return;
    final newMessage = Message(text: text.trim(), fromWho: FromWho.me);
    // Agregar un nuevo mensaje a la lista
    messageList.add(newMessage);
    print('flutter: Cantidad de mensajes: ${messageList.length}');

    // Notificara a provider que algo cambió
    notifyListeners();
    moveScrollToBottom();
  }

  // Mover el scroll hasta abajo
  Future<void> moveScrollToBottom() async {
    // Animación
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(
        // offset: Posición del máximo scroll posible
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        // Rebote al final de la animación
        curve: Curves.easeOut);
  }
}
