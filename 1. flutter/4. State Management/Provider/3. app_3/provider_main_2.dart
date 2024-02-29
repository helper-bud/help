import 'package:flutter/material.dart';
import 'package:flutter_all/provider/app_2/api_providerState.dart';
import 'package:flutter_all/provider/app_2/provider_homScreen_2.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ApiProvider()),
      ],
      child: providerApp()
  ));
}

class providerApp extends StatelessWidget {
  const providerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true
      ),
      home: const HomeScreen_2(),
    );
  }
}
