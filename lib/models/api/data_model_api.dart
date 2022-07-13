import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:suitmedia_test_muhammad_ridho_harahap/models/data_model.dart';
import 'package:suitmedia_test_muhammad_ridho_harahap/utils/api.dart';

class DataModelApi {
  final API _api = API();

  Future<List<Data>> getDataByPage(int page, var context) async {
    try {
      var response = await _api.dio.get('/users?page=$page');

      if (response.statusCode == 200) {
        ResponseResultData responseResult =
            ResponseResultData.fromJson(response.data);

        // print('Response : ${responseResult.data}');

        return responseResult.data;
      }
    } on DioError catch (e) {
      String msg = '${e.response!.statusCode!}';

      Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
    return [];
  }
}
