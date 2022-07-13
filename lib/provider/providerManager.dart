// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:suitmedia_test_muhammad_ridho_harahap/models/api/data_model_api.dart';
import 'package:suitmedia_test_muhammad_ridho_harahap/models/data_model.dart';
import 'package:suitmedia_test_muhammad_ridho_harahap/shared/constant.dart';

class ProviderManager extends ChangeNotifier {
  DataState dataState = DataState.loading;

  String userName = '';
  bool isLoading = false;
  bool nextPage = true;
  int page = 1;

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
    try {
      List<Data> tempDataList = [];
      tempDataList = await _dataModelApi.getDataByPage(page, context);

      allDataList.addAll(tempDataList);

      changeState(DataState.filled);
    } catch (e) {
      print('Error : $e');
      changeState(DataState.error);
    }
  }

  Future getMoreData(var context) async {
    if (nextPage == true) {
      page += 1;
      try {
        isLoading = true;

        var res = await getData(context);

        if (res == null) {
          nextPage = false;
        }

        isLoading = false;
        changeState(DataState.filled);
      } catch (e) {
        print('Error : $e');
        changeState(DataState.error);
      }
    } else {
      Fluttertoast.showToast(
        msg: 'You have reached end of list',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.yellow.shade600,
        textColor: darkColor,
        fontSize: 16.0,
      );
    }
  }
}
