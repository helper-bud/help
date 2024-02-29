import 'package:flutter/material.dart';

import 'package:flutter_all/provider/app_1/home_screen.dart';
import 'package:flutter_all/provider/app_1/counter_provider_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterProvider()),
        // add rest of the provider you want.
      ],
      child: const MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "MVC",
      home: HomeScreen_(),
    );
  }
}
