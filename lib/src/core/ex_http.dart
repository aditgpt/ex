// ignore_for_file: non_constant_identifier_names, always_put_control_body_on_new_line

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

import '../../ex.dart';

// ignore: constant_identifier_names
enum Method { GET, POST, PUT, DELETE, UPLOAD }

class ExHttp extends GetConnect {
  ExHttp({
    required this.baseURL,
    this.baseHeader,
    this.allowAutoSignedCertificate = true,
    this.useUserAgent = false,
    this.customUserAgent = 'ex-api',
    this.allowFollowRedirects = false,
    this.maxRedirectURL = 3,
    this.maxAuthRetry = 3,
    this.maxTimeOut,
    this.showLogHeader = false,
    this.showLogResponse = false,
    this.interceptorAddRequestModifier,
    this.interceptorAddAuthenticator,
    this.interceptorAddResponseModifier,
  });

  String baseURL;
  Map<String, String>? baseHeader;
  bool allowAutoSignedCertificate;
  String customUserAgent;
  bool useUserAgent;
  bool allowFollowRedirects;
  int maxRedirectURL;
  int maxAuthRetry;
  Duration? maxTimeOut;
  bool showLogHeader;
  bool showLogResponse;
  Function(Request<void>)? interceptorAddAuthenticator;
  Function(Request<void>)? interceptorAddRequestModifier;
  Function(Request<void>)? interceptorAddResponseModifier;

  @override
  Future<void> onInit() async {
    HttpOverrides.global = MyHttpOverrides(); // Fix Http Issue on Android SDK < 23

    try {
      allowAutoSignedCert = allowAutoSignedCertificate;

      httpClient
        ..baseUrl = baseURL
        ..errorSafety = true
        ..followRedirects = allowFollowRedirects
        ..timeout = maxTimeOut ?? 15.seconds
        ..maxAuthRetries = maxAuthRetry
        ..maxRedirects = maxRedirectURL
        ..sendUserAgent = useUserAgent
        ..userAgent = customUserAgent;

      /// add something on every http request
      if (interceptorAddRequestModifier != null) {
        httpClient.addRequestModifier<void>((request) async {
          /// [example]
          // final token = PrefHelper.userToken;
          // if (token != null && token.isNotEmpty) {
          //   request.headers['Authorization'] = 'Bearer $token';
          // }
          // request.headers.addAll(baseHeader);
          // return request;
          interceptorAddRequestModifier?.call(request);
          return request;
        });
      }

      /// if (401) -> AUTO REFRESH TOKEN
      if (interceptorAddAuthenticator != null) {
        httpClient.addAuthenticator<void>((request) async {
          /// [example]
          // if (PrefHelper.userRefreshToken.isNotNullOrEmpty) {
          // final response = await httpPost(
          //   endPoint: '/user/v1.0/renew-token',
          //   body: {
          //     'refresh_token': '${PrefHelper.userRefreshToken}',
          //   },
          // );
          // final token = response.body['data']['access_token'];
          // final rToken = response.body['data']['refresh_token'];
          // final gToken = response.body['data']['google_token'];

          // await PrefHelper.setUserToken(token);
          // await PrefHelper.setUserRefreshToken(rToken);
          // await PrefHelper.setUserGoogleToken(gToken);

          // // re-adjust headers ...
          // request.headers['Authorization'] = '$token';
          // logI('TOKEN REFRESHED!');
          // }
          interceptorAddAuthenticator?.call(request);
          return request;
        });
      }
    } on Exception {
      throw Exception('''
Please Init & Inject ExHttp on main program

== EXAMPLE ==

Get.put(
  ExHttp(
    baseURL: 'https://api.com',
    baseHeader: {},
    maxTimeOut: 30.seconds,
    maxAuthRetry: 5,
    allowFollowRedirects: true,
    showLogHeader: false,
    showLogResponse: false,
  ),
);

''');
    }
    super.onInit();
  }

  Future<Outcome> http({
    required Method method,
    required String url,
    Map<String, String>? header,
    Map<String, String>? query,
    Map<String, dynamic>? body,
  }) async {
    final result = Outcome();
    httpClient.baseUrl = '';
    // httpClient.addRequestModifier<void>((request) async {
    //   request.headers.clear();
    //   request.headers.addAll(header ?? {});
    //   return request;
    // });

    Response res;
    switch (method) {
      case Method.GET:
        res = await get(url, query: query, headers: header);
        break;
      case Method.POST:
        res = await post(url, body, headers: header);
        break;
      case Method.PUT:
        res = await put(url, body, headers: header);
        break;
      case Method.DELETE:
        res = await delete(url, headers: header);
        break;
      case Method.UPLOAD:
        res = await get(url, headers: header);
        break;
    }

    await ApiUtils.apiLog(
      response: res,
      showHeader: showLogHeader,
      showResponse: showLogResponse,
    );
    if (res.isOk) {
      result
        ..body = res.body
        ..statusCode = res.statusCode
        ..isFailure = false;
      return result;
    } else {
      return ErrorInterceptorHandling(
        response: res,
        result: result,
        url: '${httpClient.baseUrl} | $url',
      );
    }
  }

  Future<Outcome> httpGet({
    required String endPoint,
    Map<String, dynamic>? query,
    Map<String, String>? header,
    bool withToken = true,
  }) async {
    await onInit();
    final result = Outcome();
    final res = await get(endPoint, query: query, headers: header);
    await ApiUtils.apiLog(
      response: res,
      showHeader: showLogHeader,
      query: query,
      showResponse: showLogResponse,
    );

    if (res.isOk) {
      return result
        ..body = res.body
        ..statusCode = res.statusCode
        ..isFailure = false;
    } else {
      return ErrorInterceptorHandling(
        response: res,
        result: result,
        url: '${httpClient.baseUrl}$endPoint',
      );
    }
  }

  Future<Outcome> httpPost({
    String endPoint = '',
    dynamic body,
    Map<String, String>? header,
    bool withToken = true,
  }) async {
    await onInit();
    final result = Outcome();

    final res = await httpClient.post(endPoint, body: body, headers: header);
    await ApiUtils.apiLog(
      response: res,
      showHeader: showLogHeader,
      body: body,
      showResponse: showLogResponse,
    );

    if (res.isOk) {
      return result
        ..body = res.body
        ..statusCode = res.statusCode
        ..isFailure = false;
    } else {
      return ErrorInterceptorHandling(
        response: res,
        result: result,
        url: '${httpClient.baseUrl}$endPoint',
      );
    }
  }

  Future<Outcome> httpPut({
    String endPoint = '',
    dynamic body,
    Map<String, String>? header,
    bool withToken = true,
  }) async {
    await onInit();
    final result = Outcome();

    final res = await httpClient.put(endPoint, body: body);
    await ApiUtils.apiLog(
      response: res,
      showHeader: showLogHeader,
      body: body,
      showResponse: showLogResponse,
    );

    if (res.isOk) {
      return result
        ..body = res.body
        ..statusCode = res.statusCode
        ..isFailure = false;
    } else {
      return ErrorInterceptorHandling(
        response: res,
        result: result,
        url: '${httpClient.baseUrl}$endPoint',
      );
    }
  }

  Future<Outcome> httpDelete({
    String endPoint = '',
    Map<String, String>? header,
    bool withToken = true,
  }) async {
    await onInit();
    final result = Outcome();

    final res = await httpClient.delete(endPoint);
    await ApiUtils.apiLog(
      response: res,
      showHeader: showLogHeader,
      showResponse: showLogResponse,
    );

    if (res.isOk) {
      return result
        ..body = res.body
        ..statusCode = res.statusCode
        ..isFailure = false;
    } else {
      return ErrorInterceptorHandling(
        response: res,
        result: result,
        url: '${httpClient.baseUrl}$endPoint',
      );
    }
  }

  Future<Outcome> httpUploadMultipart({
    required File file,
    String endPoint = '',
    Map<String, String>? header,
    String? fileName,
    bool withToken = true,
  }) async {
    await onInit();
    final result = Outcome();

    final form = FormData({'file': MultipartFile(file, filename: fileName ?? '')});
    final res = await post(endPoint, form);
    await ApiUtils.apiLog(
      response: res,
      showHeader: showLogHeader,
      showResponse: showLogResponse,
    );

    if (res.isOk) {
      result
        ..body = res.body
        ..statusCode = res.statusCode
        ..isFailure = false;
      return result;
    } else {
      return ErrorInterceptorHandling(
        response: res,
        result: result,
        url: '${httpClient.baseUrl} | $endPoint',
      );
    }
  }

  @override
  void onReady() {
    logW('Api Service Ready!');
    super.onReady();
  }

  @override
  void onClose() {
    logW('Api Service Closed!');
    super.onClose();
  }
}

// —————————————————————————————————————————————————————————————————————————————
// MyHttpOverrides
// —————————————————————————————————————————————————————————————————————————————
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

// —————————————————————————————————————————————————————————————————————————————
// Outcome
// —————————————————————————————————————————————————————————————————————————————
class Outcome<T> {
  Outcome({
    this.isFailure = false,
    this.errorMessages,
    this.errorBody,
  });

  bool isFailure;
  dynamic statusCode;
  dynamic errorMessages;
  dynamic errorBody;
  T? body;
}

// —————————————————————————————————————————————————————————————————————————————
// ErrorInterceptorHandling
// —————————————————————————————————————————————————————————————————————————————
Outcome ErrorInterceptorHandling({
  required Outcome result,
  dynamic response,
  String? url,
}) {
  response as Response<dynamic>;
  result
    ..isFailure = true
    ..statusCode = response.statusCode
    ..errorBody = response.body;

  logW('${response.statusCode} | ${response.bodyString}');

  switch (response.statusCode) {
    case 400:
      result.errorMessages = response.body['message'] ?? '400'; // commonly
      throw Exception(result.errorMessages);
    case 401:
      result.errorMessages = 'Session anda telah habis, silahkan masuk kembali (401)';
      throw Exception(result.errorMessages);
    case 403:
      result.errorMessages = 'Access Forbidden (403)';
      throw Exception(result.errorMessages);
    case 404:
      result.errorMessages = 'Path tidak ditemukan (404)';
      throw Exception(result.errorMessages);
    case 405:
      result.errorMessages = 'Method not allowed (405)';
      throw Exception(result.errorMessages);
    case 422:
      try {
        result.errorMessages = response.body['detail'][0]['msg']; // pesan error validasi
      } catch (e) {
        result.errorMessages = response.body['message']; // commonly
      }
      throw Exception(result.errorMessages);
    case 500:
      result.errorMessages = 'Internal Server Error (500)';
      throw Exception(result.errorMessages);
    case 503:
      result.errorMessages = 'Service Unavailable (503)';
      throw Exception(result.errorMessages);
    default: // offline
      result.errorMessages = 'Tidak dapat terhubung ke server.';
      throw Exception(result.errorMessages);
  }
}

// —————————————————————————————————————————————————————————————————————————————
// Helper class
// —————————————————————————————————————————————————————————————————————————————
mixin ApiUtils {
  static Future<void> apiLog({
    required Response<dynamic> response,
    bool? showHeader,
    bool? showResponse,
    Map<String, dynamic>? query,
    dynamic body,
  }) async {
    // output += '—————————————————————————————————————————————————————————————————————————————\n';
    log('${response.request?.method ?? '-'} | ${response.request?.url ?? '-'} | ${response.statusCode ?? '-'}');

    if (showHeader == true) log('header : ${jsonEncode(response.request?.headers)}');

    try {
      if (query != null) log('query : ${jsonEncode(query)}');
    } catch (e) {
      if (query != null) log('query : $query');
    }

    try {
      if (body != null) log('body : ${jsonEncode(body)}');
    } catch (e) {
      if (body != null) log('body : $body');
    }

    try {
      if (response.isOk && showResponse == true) {
        logI('${response.bodyString}');
      }
    } on Exception catch (e) {
      log(e);
    }
  }
}
