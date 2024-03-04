/*
this is the main.dart class. where  we have the nameProvider. so to read this provider we can use 2 method
1. is using the ConsumerWidget instead of stateless widget
2. not using the consumer widget. 
*/
import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/home_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

 final namePovider  = Provider<String>((ref) {
  return "Testing";
 });  // provider reps helps us to talk with other provider.  

void main() {
  runApp(const ProviderScope(child:  MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

// _______________________________________________________________________________  using consumer widget, ref
import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref ) { // widget ref allows to communicat with other widgets from providers
  final name = ref.watch(namePovider); // using this read the value
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        Center(
          child: Text(name),
        )
      ]),
    );
  }
}

// _______________________________________________________________________________ not using consumer widget, ref
import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: 
      Consumer(
        builder: (context, ref, child) {
          final name = ref.watch(namePovider);
          return Column(
            children: [
              Center(
                child: Text(name),
              )
          ]
          );
        }
      ),
    );
  }
}


