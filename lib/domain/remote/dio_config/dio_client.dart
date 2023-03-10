import 'package:dio/dio.dart';
import 'package:ejara_test_project/domain/local/local_storage.dart';
import 'dio_error.dart';
import 'dio_intercepter.dart';

class NetworkProvider{
  final String? baseUrl;
  NetworkProvider({this.baseUrl});
  Dio _getDioInstance(){
    var dio = Dio(BaseOptions(
        baseUrl: baseUrl!,
        connectTimeout:60000,
        receiveTimeout:60000
    ));
    dio.interceptors.add(LoggerInterceptor());
    dio.interceptors.add(AuthorizationInterceptor());
    dio.interceptors.add(LogInterceptor(responseBody: true,error: true,request: true,requestBody: true));
    return dio;
  }

  Future<Response?> call(
      {
        required String path,
        required  RequestMethod method,
        dynamic body=const {},
        Map<String,dynamic> queryParams=const {}
      })async{
    Response? response;
    try{
      switch(method){
        case RequestMethod.get:
          response = await _getDioInstance().get(path, queryParameters: queryParams);
          break;
        case RequestMethod.post:
          response = await _getDioInstance()
              .post(path, data: body, queryParameters: queryParams);
          break;
        case RequestMethod.patch:
          response = await _getDioInstance()
              .patch(path, data: body, queryParameters: queryParams);
          break;
        case RequestMethod.put:
          response = await _getDioInstance()
              .put(path, data: body, queryParameters: queryParams);
          break;
        case RequestMethod.delete:
          response = await _getDioInstance()
              .delete(path, data: body, queryParameters: queryParams);
          break;
      }
      return response;
    }on DioError catch (error) {
      return Future.error(ApiError.fromDio(error));
    }
  }
}


class AuthorizationInterceptor extends Interceptor {

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async{
    ///Initialize local Storage
    LocalCachedData localCachedData = LocalCachedData();
    String? token= await localCachedData.getAuthToken();
    if (token != null && token.isNotEmpty) {
      options.headers["Authorization"] = "Bearer $token";
    }
    options.headers["Accept"] = "application/json";
    options.headers["Content-Type"] = "application/json";
    options.headers["api-key"] = "K[bb@c*heYNTOd[UVBmLevq0(";
    options.headers["client-id"] = "02d5f007e2";
    // options.headers['app-version'] = "3.1.5";
    // options.headers['app-platform'] = "android-test";
    // options.headers['client'] = "mobile";
    // options.headers["Accept-language"] = "en";

    super.onRequest(options, handler);
  }
}

enum RequestMethod { get, post, put, patch, delete }