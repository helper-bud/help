import 'package:flutter/material.dart';
import 'package:flutter_all/mvc/app_1/controller.dart';

// just add this class in main.dart in home route.
class ViewScreen extends StatefulWidget {
  const ViewScreen({super.key});

  @override
  State<ViewScreen> createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {
  final CountController _controller = CountController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(_controller != null? '${_controller.counter}' : "0", // using mvc pattern.
                style: TextStyle(fontSize: 20),),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(onPressed: (){
                    setState(() {
                      _controller.increment();// using mvc
                    });
                  }, child: Icon(Icons.add),),
                  SizedBox(width: 10,),
                  FloatingActionButton(onPressed: (){
                    setState(() {
                      _controller.decrement();// using mvc
                    });
                  }, child: Icon(Icons.remove),),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
