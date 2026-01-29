import 'package:tut_app/app/app_imports.dart';

class DioFactory {
  Future<Dio> getDio() async {
    Dio dio = Dio();
    dio.options = BaseOptions(
      baseUrl: Constants.baseUrl,
      sendTimeout: Duration(minutes: 1),
      receiveTimeout: Duration(minutes: 1),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'send token here',
        'lang': 'en',
      },
    );

    if (!kReleaseMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
        ),
      );
    }
    return dio;
  }
}
