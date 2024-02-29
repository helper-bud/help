import 'dart:convert';
import 'package:flutter_all/provider/app_2/api_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  // this is the model class without model
  Future<dynamic> getDataWithoutModel() async{
    dynamic apiData;
    var response_ = await http.get(Uri.parse("https://reqres.in/api/users?page=2"));
    if(response_.statusCode == 200 || response_.statusCode == 201){
      apiData = jsonDecode(response_.body);
    } else{
      print("api error without model");
    }
    return apiData;
  }

}
