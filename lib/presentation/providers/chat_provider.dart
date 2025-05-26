import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  //Controlador quemaneja la posición del scroll
  final ScrollController chatScrollController = ScrollController();
  final getYesNoAnswer = GetYesNoAnswer();
  List<Message> messageList = [];

  Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty) return;
    final newMessage = Message(
      text: text.trim(),
      fromWho: FromWho.me,
      timestamp: DateTime.now(),
    );
    messageList.add(newMessage);

    if (text.endsWith('?')) {
      herReplay();
    }
    print(
        'Cantidad de mensajes: ${messageList.length}'); // Si no hay mensaje no hace nada
    notifyListeners(); // Notificar al provider que hay un cambio
    moveScrollToBottom();
  }

  //mover el scroll al final de la lista
  Future<void> moveScrollToBottom() async {
    //animación
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(
        //posicion del maximo scroll posible
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        //Rebote al final de la animación
        curve: Curves.easeOut);
  }

  // Crear la respuesta de la otra persona
  Future<void> herReplay() async {
    // Obtener el mensaje de la petición
    final herMessage = await getYesNoAnswer.getAnswer();
    // Añadir el mensaje a la lista de mensajes
    messageList.add(herMessage);
    // Notificar al provider que hay un cambio
    notifyListeners();
    // Mover el scroll al final de la lista
    moveScrollToBottom();
  }
}
