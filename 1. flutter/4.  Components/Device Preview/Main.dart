import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'form/form_2/form_2.dart';

void main() {
  runApp(DevicePreview(enabled: !kReleaseMode, builder: (context) => MyApp()));
  // here is the implmentation of the preview.
  // gives an interface or like  a admin panel like structure to see the ouput in different screen. 
  
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Time Input Example',
      home: FormV2(),
    );
  }
}
