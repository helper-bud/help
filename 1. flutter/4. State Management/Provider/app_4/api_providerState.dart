
import 'package:flutter/material.dart';
import 'package:flutter_all/provider/app_2/ResultScreen.dart';
import 'package:flutter_all/provider/app_2/api_model.dart';
import 'package:flutter_all/provider/app_2/api_services.dart';

class ApiProvider with ChangeNotifier{


  bool isLoading =  true;

  getData( BuildContext context, String email, String password) async{
    await ApiServices().userLogin(email, password).then((value) {
      isLoading = false;
      Navigator.push(context, MaterialPageRoute(builder: (context) => ResultScreen(
        token : value['token'].toString())));
    })
        .onError((error, stackTrace) {
      isLoading = false;
    });
    notifyListeners();
  }


}