import 'dart:convert';

import 'package:dartapp/core/error/exception.dart';
import 'package:dartapp/features/main/data/models/screen_data_model.dart';
import 'package:http/http.dart' as http;

abstract class ScreenDataDatasource {
  Future<ScreenDataModel> getScreenData(int number);
}

class ScreenDataDatasourceImpl implements ScreenDataDatasource {
  final http.Client client;

  ScreenDataDatasourceImpl({required this.client});

  @override
  Future<ScreenDataModel> getScreenData(int number) async {
    final http.Response response = await client.get(
      Uri.parse("http://127.0.0.1:3000/$number"),
    );

    if (response.statusCode == 200) {
      print(json.decode(response.body));
      return ScreenDataModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
