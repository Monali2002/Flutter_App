import 'package:flutter/material.dart';

class ChatOptionModel{
  String iconpath;
  String text;

  ChatOptionModel({
    required this.iconpath,
    required this.text,
});


  static List <ChatOptionModel> getChatOption() {
    List <ChatOptionModel> chatoption = [];

    chatoption.add(
        ChatOptionModel(
          iconpath: 'assets/images/photo.png',
          text: 'Photo edition',
        )
    );

    chatoption.add(
        ChatOptionModel(
          iconpath: 'assets/images/video.png',
          text: 'Video generation',
        )
    );

    chatoption.add(
        ChatOptionModel(
          iconpath: 'assets/images/edu.png',
          text: 'Education feedback',
        )
    );

    chatoption.add(
        ChatOptionModel(
          iconpath: 'assets/images/code.png',
          text: 'Code generation',
        )
    );

    chatoption.add(
        ChatOptionModel(
          iconpath: 'assets/images/audio.png',
          text: 'Audio generation',
        )
    );

    return chatoption;
  }
}
