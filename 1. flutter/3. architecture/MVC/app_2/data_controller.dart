
import 'dart:convert';

import 'package:flutter_all/mvc/app_2/data_model.dart';
import 'package:http/http.dart' as http;


class DataController{

  Future<List<json_model>> getPostList() async{
    var url = Uri.https("jsonplaceholder.typicode.com",'/posts'); // api call
    final response = await http.get(url);

    print(response.statusCode);
    print(response.body);

    List<json_model> arr = [];
    List<dynamic> data = jsonDecode(response.body);
    for(var i = 0; i<data.length; i++){
      arr.add(
        json_model.fromJson(data[i])
      );
    }

    return arr;


  }

}