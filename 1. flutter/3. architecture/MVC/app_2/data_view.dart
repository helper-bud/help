
import 'package:flutter/material.dart';
import 'package:flutter_all/mvc/app_2/data_controller.dart';
import 'package:flutter_all/mvc/app_2/data_model.dart';

class DataViewScreen extends StatefulWidget {
  const DataViewScreen({super.key});

  @override
  State<DataViewScreen> createState() => _DataViewScreenState();
}

class _DataViewScreenState extends State<DataViewScreen> {
  // variables
  List<json_model> posts = [];
  final datacontroller =  DataController();

  // methods
  void _getPosts() async{
    final data = await datacontroller.getPostList();
    setState(() {
      posts = data;
    });
  }

  @override
  void initState() {
    _getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width:  MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: (posts.length < 1)
              ? Text("Loading")
                :ListView.builder(itemCount: posts.length,itemBuilder: (context, index){
                  return Padding(
                      padding: const EdgeInsets.all(16),
                    child: Text("${posts[index].body}")
                  );
      })
    );
  }
}
