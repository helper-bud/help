import 'package:flutter/material.dart';
import 'package:flutter_all/provider/app_1/counter_provider_model.dart';
import 'package:provider/provider.dart';

import 'count_controller.dart';

class HomeScreen_ extends StatefulWidget {
  const HomeScreen_({super.key});
  @override
  State<HomeScreen_> createState() => _HomeScreen_State();
}

class _HomeScreen_State extends State<HomeScreen_> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        title: const Text("Counter", style: TextStyle(color: Colors.white),),
      ),
      body: const Center(
        // this is the controller class which is responsible for returning the upated valu
        child: Count_Controller(),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey,
        child: const Icon(Icons.add),
        onPressed: (){
          // this reads on the provider, if there is any kind of changes.
          context.read<CounterProvider>().increament();
        },
      ),
    );
  }
}
