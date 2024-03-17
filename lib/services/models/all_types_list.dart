import 'package:flutter/material.dart';

class AllTypesModel {

  String iconPath;
  String text;
  String background;

  AllTypesModel({
    required this.iconPath,
    required this.text,
    required this.background,
  });

  static List <AllTypesModel> getAllTypes() {
    List <AllTypesModel> alltypes = [];

    alltypes.add(
        AllTypesModel(
          background: 'assets/images/Rectangle 1.png',
          iconPath: 'assets/images/shape 1.png',
          text: 'HTML\n welcome from',
        )
    );

    alltypes.add(
        AllTypesModel(
          background: 'assets/images/Rectangle 2.png',
          iconPath: 'assets/images/shape 2.png',
          text: 'Chat with the\n smartest AI',
        )
    );
    alltypes.add(
        AllTypesModel(
          background: 'assets/images/Rectangle 3.png',
          iconPath: 'assets/images/shape 3.png',
          text: 'welcome from',
        )
    );

    return alltypes;
  }
}