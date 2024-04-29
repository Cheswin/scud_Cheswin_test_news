import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/newsModel.dart';
import 'constants.dart';

Future<dynamic>  getnews() async {
  var url = Uri.parse(api);
  try {
    var response = await http.get(url);
    List responseJson = json.decode(response.body)["articles"];
    // print(responseJson);
    List<NewsModel> list =
        responseJson.map((e) => NewsModel.fromJson(e)).toList();
    print(list.length.toString());
    return list;
  } catch (e) {
    return "something went wrong";
  }
}
