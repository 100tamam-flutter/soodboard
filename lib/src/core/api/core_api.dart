import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

import '../storage.dart';

class CoreApi {
  final _client = Client();

  Future<Response?> get(
    Uri url, {
    Map<String, String>? headers,
    String? insertedToken,
  }) async {
    final token = Storage.instance.accessToken ?? insertedToken;
    try {
      return await _client.get(
        url,
        headers: {
          HttpHeaders.contentTypeHeader: ContentType.json.mimeType,
          if (token != null) 'access': token,
        }..addAll(headers ?? {}),
      );
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future<Response?> post(
    Uri url, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) async {
    final token = Storage.instance.accessToken;
    try {
      return await _client.post(
        url,
        body: body == null ? null : jsonEncode(body),
        headers: {
          HttpHeaders.contentTypeHeader: ContentType.json.mimeType,
          if (token != null) 'access': token,
        }..addAll(headers ?? {}),
      );
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future<Response?> postMultipart(
    Uri url, {
    Map<String, String>? headers,
    required Map<String, String> body,
  }) async {
    final token = Storage.instance.accessToken;
    try {
      final request = MultipartRequest("POST", url);
      request.fields.addAll(body);
      request.headers.addAll(
        {
          HttpHeaders.contentTypeHeader: ContentType.json.mimeType,
          if (token != null) 'access': token,
        }..addAll(headers ?? {}),
      );
      final response = await request.send();
      return Response.fromStream(response);
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future<Response?> put(
    Uri url, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) async {
    final token = Storage.instance.accessToken;
    try {
      return await _client.put(
        url,
        body: body == null ? null : jsonEncode(body),
        headers: {
          HttpHeaders.contentTypeHeader: ContentType.json.mimeType,
          if (token != null) 'access': token,
        }..addAll(headers ?? {}),
      );
    } catch (e) {
      if (kDebugMode) {
        debugPrint(e.toString());
      }
      return null;
    }
  }

  Future<Response?> patch(
    Uri url, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) async {
    final token = Storage.instance.accessToken;
    try {
      return await _client.patch(
        url,
        body: body == null ? null : jsonEncode(body),
        headers: {
          HttpHeaders.contentTypeHeader: ContentType.json.mimeType,
          if (token != null) 'access': token,
        }..addAll(headers ?? {}),
      );
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future<Response?> delete(
    Uri url, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) async {
    final token = Storage.instance.accessToken;
    try {
      return await _client.delete(
        url,
        body: body == null ? null : jsonEncode(body),
        headers: {
          HttpHeaders.contentTypeHeader: ContentType.json.mimeType,
          if (token != null) 'access': token,
        }..addAll(headers ?? {}),
      );
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
