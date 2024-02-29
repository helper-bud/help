
import 'package:flutter/material.dart';
import 'package:flutter_all/provider/app_2/api_model.dart';
import 'package:flutter_all/provider/app_2/api_services.dart';

class ApiProvider with ChangeNotifier{

  dynamic apiResponse ;
  bool isLoading_2 = true;

  getDataWithoutModel() async{

    await ApiServices().getDataWithoutModel().then((value) => {
      apiResponse = value
    }).onError((error, stackTrace) => {});
    isLoading_2 = false;
    notifyListeners();
  }


}
