import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin MessagesMixin on GetxController {
  void messageListener(Rxn<MessageModel> message) {
    ever<MessageModel?>(message, (model) {
      if (model != null) {
        Get.snackbar(
          model.title,
          model.message,
          backgroundColor: model.type.color(),
        );
      }
    });
  }
}

class MessageModel {
  final String title;
  final String message;
  final MessageType type;

  MessageModel({
    required this.title,
    required this.message,
    required this.type,
  });

  MessageModel.error({
    required this.title,
    required this.message,
  }) : type = MessageType.error;

   MessageModel.success({
    required this.title,
    required this.message,
  }) : type = MessageType.success;

  MessageModel.info({
    required this.title,
    required this.message,
  }) : type = MessageType.info;
}

// Criando Enum do tipo de messagens "Exemplo do type: error => para erro | info => para informação";
enum MessageType { error, info, success }

extension MessageTypeExtension on MessageType {
  Color color() {
    switch(this) {
      case MessageType.error:
        return Colors.red[600] ?? Colors.red;
      case MessageType.success:
        return Colors.greenAccent[400] ?? Colors.greenAccent;
      case MessageType.info:
        return Colors.blue[200] ?? Colors.blue;
    }
      
       
  }
}