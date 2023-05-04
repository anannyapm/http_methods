import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http_methods/user_response/user_response.dart';

const String baseUrl = 'https://jsonplaceholder.typicode.com';
const String userEndPoint = '/users/';

Future<dynamic> getUser({required String userid}) async {
  var url = Uri.parse(baseUrl + userEndPoint + userid);
  final _response = await http.get(url);
  // data we require to see will be in body, get will usually return a lot
  //of details related to response from uel like status codes, header details, etc
  if (_response.statusCode == 200) //success code ==>200
  {
    final _responseAsMap = jsonDecode(_response.body)
        as Map<String, dynamic>; // converst the json string into map object
    final data = UserResponse.fromJson(_responseAsMap);
    return data;
  } else {
    return null;
  }
}

Future<dynamic> postUser(dynamic object) async {
  var url = Uri.parse(baseUrl + userEndPoint);
  var payload = jsonEncode(object);
  var headers = {
    'Content-Type': 'application/json',
  };
  final _response = await http.post(url, body: payload, headers: headers);

  // data we require to see will be in body, get will usually return a lot
  //of details related to response from uel like status codes, header details, etc
  if (_response.statusCode ==
      201) //success code ==>200,201(when data added to backend)
  {
    print(_response.body);
    return _response.body;
  } else {
    return;
  }
}

Future<dynamic> putUser({required String userid,required dynamic object}) async {
  var url = Uri.parse(baseUrl + userEndPoint+userid);
  var payload = jsonEncode(object);
  var headers = {
    'Content-Type': 'application/json',
  };
  final _response = await http.put(url, body: payload, headers: headers);

  // data we require to see will be in body, get will usually return a lot
  //of details related to response from uel like status codes, header details, etc
  if (_response.statusCode ==
      200) //success code ==>200,201(when data added to backend)
  {
    print(_response.body);
    return _response.body;
  } else {
    return;
  }
}

Future<dynamic> delUser(String userid) async {
    var url = Uri.parse(baseUrl + userEndPoint + userid);
  final _response = await http.delete(url);
  // data we require to see will be in body, get will usually return a lot
  //of details related to response from uel like status codes, header details, etc
  if (_response.statusCode == 200) //success code ==>200
  {
 
    print(_response.body);

    return _response.body;
  } else {
    return null;
  }
}
