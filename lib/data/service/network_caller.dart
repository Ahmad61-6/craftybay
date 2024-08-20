import 'dart:convert';

import 'package:crafty_bay/data/models/response_data.dart';
import 'package:http/http.dart';

class NetworkCaller {
  Future<ResponseData> getRequest(
    String url,
  ) async {
    final Response response = await get(Uri.parse(url));
    if (response.statusCode == 200) {
      final decodeResponse = jsonDecode(response.body);
      if (decodeResponse['msg'] == 'success') {
        return ResponseData(
            isSuccess: true,
            statusCode: response.statusCode,
            responseData: decodeResponse);
      } else {
        return ResponseData(
            isSuccess: false,
            statusCode: response.statusCode,
            responseData: decodeResponse,
            errorMessage: decodeResponse['data'] ?? 'Something went wrong');
      }
    } else {
      return ResponseData(
          isSuccess: false, statusCode: response.statusCode, responseData: '');
    }
  }

  Future<ResponseData> postRequest(String url,
      {Map<String, dynamic>? body}) async {
    final Response response =
        await post(Uri.parse(url), body: jsonEncode(body));
    if (response.statusCode == 200) {
      final decodeResponse = jsonDecode(response.body);
      if (decodeResponse['msg'] == 'success') {
        return ResponseData(
            isSuccess: true,
            statusCode: response.statusCode,
            responseData: decodeResponse);
      } else {
        return ResponseData(
            isSuccess: false,
            statusCode: response.statusCode,
            responseData: decodeResponse,
            errorMessage: decodeResponse['data'] ?? 'Something went wrong');
      }
    } else {
      return ResponseData(
          isSuccess: false, statusCode: response.statusCode, responseData: '');
    }
  }
}
