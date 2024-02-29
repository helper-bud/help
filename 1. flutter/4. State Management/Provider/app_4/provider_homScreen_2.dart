import 'package:flutter/material.dart';
import 'package:flutter_all/provider/app_2/api_providerState.dart';
import 'package:provider/provider.dart';


// 30: 57
class HomeScreen_2 extends StatefulWidget {
  const HomeScreen_2({super.key});
  @override
  State<HomeScreen_2> createState() => _HomeScreen_2State();
}

class _HomeScreen_2State extends State<HomeScreen_2> {

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text("Login Screen",style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: "Enter Email"
                ),
              ),
              const SizedBox(height: 10,),
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(
                    hintText: "Enter Password"
                ),
              ),
              const SizedBox(height: 10,),
              
              ElevatedButton(onPressed: (){

                WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                  Provider.of<ApiProvider>(context, listen: false)
                      .getData(context, emailController.text.toString(), passwordController.text.toString());
                });
              },
                  child: Provider.of<ApiProvider>(context).isLoading
                  ? const CircularProgressIndicator()
                  : const Text("Login")
              ),
            ],
          ),
        ),
      )





    );
  }
}
