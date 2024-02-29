
import 'package:flutter/material.dart';
import 'package:flutter_all/provider/app_2/api_model.dart';
import 'package:flutter_all/provider/app_2/api_services.dart';

class ApiProvider with ChangeNotifier{
  late api_model model;
  bool isLoading =  true;

  getData() async {
    model = await ApiServices().getData();
    isLoading = false;
    notifyListeners();
  }
}