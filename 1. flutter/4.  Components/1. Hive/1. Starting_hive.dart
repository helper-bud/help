// https://www.youtube.com/playlist?list=PLCaS22Sjc8YTzcwGENMFDVc4XDRA2p3Ho
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  // is a function call that ensures that the Flutter framework's bindings are initialized before proceeding with the execution of the application.
  await Hive.initFlutter(); // initialize hive
  //await Hive.initFlutter("myLocation"); // initialize hive in a specific location.
  init_hive();
}

void init_hive() async {
  // data stored in box
  var specified_box_type =
      await Hive.openBox<String>("myStringbox"); // can be specified.

  var box = await Hive.openBox("mybox");
  var box_instance = Hive.box("mybox");

  print(box.name); // prints the box name
  print(box.path); // prints the box path

  // write data in box
  box.put("id", 1);
  box.put("name", "tom");
  box.put("language",
      ["c", "python", "java"]); // putting multiple values against simple key
  box.putAll(
      {"dept": "IT", "designation": "Manager"}); // putting values in map.
  // hive stores the keys in ascending order. '
  // To understand it, hive stacks the values. When you type hive.keys. it will print the last keys that you provided.
  print(box.keys);
  print(box.values);
  print(box.length);

  // Read values from hive
  print(box.get("dept"));
  print(box.get("language"));
  // if printing the keys that doesn't exist
  print(box.get("x", defaultValue: "This key does not exist"));
  // update the values in box.
  box.put("name", "john");
  print(box.get("name"));
  // delete the values in box
  box.delete("name"); //box.deleteAll(box.keys); // deletes all the values
  print(box.get("name")); // null
  // remove the files or db
  box.deleteFromDisk();
}
