import 'package:dio/dio.dart';

class ApiService {
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
