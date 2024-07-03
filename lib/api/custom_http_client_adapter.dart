// ignore_for_file: deprecated_member_use
import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class CustomHttpClientAdapter{
  @override
  late HttpClient client;

  CustomHttpClientAdapter() {
    client = HttpClient();
    client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }

  @override
  void close({bool force = false}) {
    client.close(force: force);
  }

  @override
  Future<ResponseBody> fetch(
      RequestOptions options,
      Stream<List<int>>? requestStream,
      Future cancelFuture) async {
    final HttpClientRequest request = await client.openUrl(options.method, options.uri);

    options.headers.forEach((key, v) {
      request.headers.set(key, v);
    });

    if (requestStream != null) {
      await request.addStream(requestStream);
    }

    final HttpClientResponse response = await request.close();

    final statusCode = response.statusCode;
    final headers = <String, List<String>>{};

    response.headers.forEach((key, values) {
      headers[key] = values;
    });

    final stream = response.transform(StreamTransformer.fromHandlers()); 

    return ResponseBody(stream as Stream<Uint8List>, statusCode, headers: headers);
  }
}

