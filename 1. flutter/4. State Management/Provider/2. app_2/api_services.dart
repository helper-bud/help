import 'dart:convert';

import 'package:flutter_all/provider/app_2/api_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {

  Future<api_model> getData() async{
    late api_model model;
    final respone = await http.get(Uri.parse("https://reqres.in/api/users?page=2"));
    if(respone.statusCode == 200 || respone.statusCode == 201){
      model =  api_model.fromJson(jsonDecode(respone.body));
    }
    else{
      print("api erorr");
    }
    return model;
  }


}