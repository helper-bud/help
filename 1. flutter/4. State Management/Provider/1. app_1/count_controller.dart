
import 'package:flutter/material.dart';
import 'package:flutter_all/provider/app_1/counter_provider_model.dart';
import 'package:provider/provider.dart';
class Count_Controller  extends StatelessWidget {
  const Count_Controller ({super.key});

  @override
  Widget build(BuildContext context) {
    final myProvider = context.watch<CounterProvider>();
    return  Text(myProvider.count.toString(), textScaleFactor: 7,);
  }
}
