import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test_desktop/utils/utils.dart';
import '../models/result.dart';

abstract class BaseProvider<T> with ChangeNotifier{
  late String _endpoint;
  late String _baseUrl;

  BaseProvider(String endpoint){
    _baseUrl = const String.fromEnvironment("baseUrl", defaultValue: "https://localhost:7277/");
    _endpoint = endpoint;
  }

  String get baseUrl => _baseUrl;
  

  Future<Result<T>> getAll({dynamic filters}) async {
    var url = "$_baseUrl$_endpoint";
    var uri = Uri.parse(url);
    var headers = createHeaders();

    var response = await http.get(uri, headers: headers);
    if(isValidResponse(response)){
      var data = jsonDecode(response.body);
      var result = Result<T>();
      for(var item in data){
        result.list.add(fromJson(item));
      }
      return result;
    }
    else{
      throw Exception("Greška...");
    }
  }

  Future<T> getById(int id) async{
    var url = "$_baseUrl$_endpoint/$id";
    var uri = Uri.parse(url);
    var headers = createHeaders();

    var response = await http.get(uri, headers: headers);

    if(isValidResponse(response)){
      var data = jsonDecode(response.body);

      return fromJson(data);
    }
    else{
      throw Exception("Greška...");
    }
  }

  Future<T> insert(dynamic request)async {
    var url = "$_baseUrl$_endpoint";
    var uri = Uri.parse(url);
    var headers = createHeaders();
    var object = jsonEncode(request);

    var response = await http.post(uri, headers: headers, body: object);
    if(isValidResponse(response)){
      var data = jsonDecode(response.body);
      return fromJson(data);
    }
    else{
      throw Exception("...");
    }
  }
  
  Map<String, String> createHeaders() {
    String username = Authorization.username ?? "";
    String password = Authorization.password ?? "";
    String creds = "Basic ${base64Encode(utf8.encode('$username:$password'))}";

    var headers = {
      "Content-Type" : "application/json",
      "Authorization" : creds
    };

    return headers;
  }
  
  bool isValidResponse(http.Response response) {
    if(response.statusCode <= 299){
      return true;
    }
    else if(response.statusCode == 401){
      throw Exception("Netačan username i/ili password");
    }
    else if(response.statusCode == 403){
      throw Exception("Pristup zabranjen");
    }
    else{
      dynamic message = "Nepredviđena greška";
      Map<String,dynamic> _error = jsonDecode(response.body);
      if(_error.containsKey('errors')){
        message = _error['errors']['error'][0];
      }
      throw Exception(message);
    }
  }

  T fromJson(Map<String,dynamic> json){
    throw Exception("Implement fromJson method");
  }

  String getQueryString(Map params,
      {String prefix: '&', bool inRecursion: false}) {
    String query = '';
    params.forEach((key, value) {
      if (inRecursion) {
        if (key is int) {
          key = '[$key]';
        } else if (value is List || value is Map) {
          key = '.$key';
        } else {
          key = '.$key';
        }
      }
      if (value is String || value is int || value is double || value is bool) {
        var encoded = value;
        if (value is String) {
          encoded = Uri.encodeComponent(value);
        }
        query += '$prefix$key=$encoded';
      } else if (value is DateTime) {
        query += '$prefix$key=${(value as DateTime).toIso8601String()}';
      } else if (value is List || value is Map) {
        if (value is List) value = value.asMap();
        value.forEach((k, v) {
          query +=
              getQueryString({k: v}, prefix: '$prefix$key', inRecursion: true);
        });
      }
    });
    return query;
  }

}