import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  // Controlador que maneja la posición del scroll
  final ScrollController chatScrollController = ScrollController();
  final getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [];

  Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty) return;
    final newMessage = Message(text: text.trim(), fromWho: FromWho.me);
    // Agregar un nuevo mensaje a la lista
    messageList.add(newMessage);
    print('flutter: Cantidad de mensajes: ${messageList.length}');

    // Detectar si el usario hizo una pregunta
    if (text.endsWith('?')) {
      herReply();
    }

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

  // Crear la respuesta de ella
  Future<void> herReply() async {
    // Obtener el mensaje de la petición HTTP
    final herMessage = await getYesNoAnswer.getAnswer();

    // Añadimos el mensaje de ella a la lista de mensajes
    messageList.add(herMessage);

    // Notificar a provider los cambios
    notifyListeners();

    // Mover el scroll hasta el último mensaje
    moveScrollToBottom();
  }
}
