import 'dart:convert';
import 'package:http/http.dart';
import 'package:movie_verse/core/service/network_response.dart';

class ApiService {
  static Future<NetworkResponse> getMovie(String uri) async {
    Map<String, String> headers = {'Content-Type': 'application/json'};

    try {
      final response = await get(Uri.parse(uri), headers: headers);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final decodeData = jsonDecode(response.body);

        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          responsiveData: decodeData,
        );
      } else {
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
        );
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
