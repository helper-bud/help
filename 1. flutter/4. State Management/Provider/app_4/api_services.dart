import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiServices {

  Future<dynamic> userLogin(String email, String password) async{
    dynamic apiResponse;
    var response_ = await http.post( // must post. do not use get.
        Uri.parse("https://reqres.in/api/login"),
       body: {
          "email" : email,
          "password" : password
       }
    );

    if(response_.statusCode == 200){
      apiResponse = jsonDecode(response_.body);
    } else{
      print("api error without model");
    }
    return apiResponse;
  }


}