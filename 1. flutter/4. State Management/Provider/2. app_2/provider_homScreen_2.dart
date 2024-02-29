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
    Provider.of<ApiProvider>(context, listen: false).getData(); // provider
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ApiProvider>(context);
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text("Api's Call"),
      ),

      body:
      provider.isLoading
          ? const Center(child: CircularProgressIndicator(color: Colors.red,),) // if true
          : ListView.builder(itemCount: provider.model.data!.length, itemBuilder:(context, index){
            return ListTile(
              title: Text(provider.model.data![index].firstName.toString()),
              subtitle: Text(provider.model.data![index].email.toString()),
            );
      },)





    );
  }
}
