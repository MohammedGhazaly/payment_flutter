import 'package:dio/dio.dart';

class ApiService {
  ApiService._();
  static ApiService? _instance;
  static ApiService getInstance() {
    if (_instance == null) {
      _instance = ApiService._();
    }
    return _instance!;
  }

  final Dio dio = Dio();
  Future<Response<dynamic>> post(
      {required Map<String, dynamic> data,
      required String url,
      required String token,
      String? contentType}) async {
    return await dio.post(
      url,
      data: data,
      options: Options(
        contentType: contentType,
        headers: {
          "Authorization": "Bearer $token",
        },
      ),
    );
  }
}
