import 'package:flutter/material.dart';
import 'package:scoreboard/misc/message_service/message_widget.dart';

class MessageService {
  MessageWidgetState get messageState => MessageWidget.globalKey.currentState;

  /// Deliver global [SnackBar]
  void show(String message, [SnackBarAction action]) =>
      messageState.show(message, action);
}
