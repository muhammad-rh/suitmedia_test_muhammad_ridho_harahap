// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:suitmedia_test_muhammad_ridho_harahap/models/api/data_model_api.dart';
import 'package:suitmedia_test_muhammad_ridho_harahap/models/data_model.dart';
import 'package:suitmedia_test_muhammad_ridho_harahap/shared/constant.dart';

class ProviderManager extends ChangeNotifier {
  DataState dataState = DataState.loading;

  String userName = '';

  final DataModelApi _dataModelApi = DataModelApi();
  List<Data> allDataList = [];

  void changeState(DataState state) {
    dataState = state;
    notifyListeners();
  }

  void checkPalindrome(String name, String text, var context) {
    try {
      String getText = text.split('').reversed.join();
      final String res;

      if (text.toLowerCase() == getText.toLowerCase()) {
        res = '$text is Palindrome';
      } else {
        res = '$text isn\'t Palindrome';
      }

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: textPoppins(
              'Hey $name',
              24,
              Colors.black,
              FontWeight.w600,
            ),
            content: Text(res),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: textPoppins(
                  'OK',
                  16,
                  primaryColor,
                  FontWeight.w600,
                ),
              ),
            ],
          );
        },
      );
    } catch (e) {
      print('Error : $e');
    }
  }

  void setUserName(String name, var context) {
    try {
      userName = name;
      Navigator.pushNamed(context, '/secondScreen');
    } catch (e) {
      print('Error : $e');
    }
  }

  Future getData(var context) async {
    changeState(DataState.loading);

    try {
      allDataList = await _dataModelApi.getDataByPage(1, context);

      changeState(DataState.filled);
    } catch (e) {
      print('Error : $e');
      changeState(DataState.error);
    }
  }
}
