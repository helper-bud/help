import 'package:flutter/material.dart';
import 'package:flutter_all/provider/app_2/api_providerState.dart';
import 'package:provider/provider.dart';



class HomeScreen_2 extends StatefulWidget {
  const HomeScreen_2({super.key});
  @override
  State<HomeScreen_2> createState() => _HomeScreen_2State();
}

class _HomeScreen_2State extends State<HomeScreen_2> {

  @override
  void initState() {
    // without model call
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ApiProvider>(context, listen: false).getDataWithoutModel();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ApiProvider>(context); // without creating the model class
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text("Api's Call without model"),
      ),

      body: Provider.of<ApiProvider>(context).isLoading_2
            ? const Center(child: CircularProgressIndicator(color: Colors.red,),) // if true,
            : ListView.builder(
        itemCount: Provider.of<ApiProvider>(context).apiResponse['data'].length,
        itemBuilder:(context, index){
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(Provider.of<ApiProvider>(context).apiResponse['data'][index]['avatar']),
                  ),
                  title: Text(Provider.of<ApiProvider>(context).apiResponse['data'][index]['last_name'].toString()),
                  subtitle: Text(Provider.of<ApiProvider>(context).apiResponse['data'][index]['email']),
                );
              },
      )


    );
  }
}
