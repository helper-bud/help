import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter(); // initialize hive
  await Hive.openBox("shopping_box"); // open the box where you want to store the data. 
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScree(), // code is in here 
    );
  }
}

class HomeScree extends StatefulWidget {
  const HomeScree({super.key});
  @override
  State<HomeScree> createState() => _HomeScreeState();
}

// hive crud implemented here. 
class _HomeScreeState extends State<HomeScree> {
  final TextEditingController _nameEditingController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final shopping_box = Hive.box("shopping_box");
  List<Map<String, dynamic>> _items = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    refreshItems();
  }

  @override
  Widget build(BuildContext context) { // main widget class. 
    return Scaffold(
      appBar: _appBar(),
      floatingActionButton: _floatingActionButton(context),
      body: ListView.builder(
          itemCount: _items.length,
          itemBuilder: (_, index) {
            final currentItem = _items[index];
            return itemCard(currentItem, context);
          }),
    );
  }

  // list item in the to do list. 
  Card itemCard(Map<String, dynamic> currentItem, BuildContext context) {
    return Card(
      color: Colors.orange.shade200,
      margin: EdgeInsets.all(10),
      elevation: 3,
      child: ListTile(
        title: Text(currentItem['name']),
        subtitle: Text(currentItem['quantity']),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
                onPressed: () {
                  showForm(context, currentItem['key']);
                },
                icon: Icon(Icons.edit)),
            IconButton(
                onPressed: () {
                  _deleteItemInHive(currentItem['key']);
                },
                icon: Icon(Icons.delete))
          ],
        ),
      ),
    );
  }

  // widgets are seperately created. 
    AppBar _appBar() {
    return AppBar(
      title: Text("Hive Box"),
    );
  }


  void refreshItems() {
    final data = shopping_box.keys.map((value) {
      final item = shopping_box.get(value);
      return {"key": value, "name": item["name"], "quantity": item["quantity"]};
    }).toList();
    setState(() {
      _items = data.reversed.toList();
      print(_items.length);
    });
  }

  // add items in the dart. 
  Future<void> _createItemInHive(Map<String, dynamic> newItem) async {
    await shopping_box.add(newItem);
    // using .add hive will auto generate an ID. But we can assign it manually.
    refreshItems();
  }

  // update items in the dart. 
  Future<void> _updateItemInHive(
      int itemKey, Map<String, dynamic> newItem) async {
    await shopping_box.put(itemKey, newItem);
    refreshItems();
  }

  // delete items in the dart. 
  Future<void> _deleteItemInHive(int itemkey) async {
    await shopping_box.delete(itemkey);
    refreshItems();
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("An item has been deleted")));
  }

// floating action button 
  FloatingActionButton _floatingActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showForm(context, null);
      },
      child: Icon(Icons.add),
    );
  }


  // show modal bottom sheet. 
  void showForm(BuildContext context, int? itemkey) async {
    if (itemkey != null) {
      final existingItem =
          _items.firstWhere((element) => element['key'] == itemkey);
      _nameEditingController.text = existingItem['name'];
      _quantityController.text = existingItem['quantity'];
    }
    var bottomPad = MediaQuery.of(context)
        .viewInsets
        .bottom; // to calculate the overlays by the keyboard.
    showModalBottomSheet(
        context: context,
        elevation: 5,
        isScrollControlled: true,
        builder: (_) => Container(
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: bottomPad, top: 15, left: 15, right: 15),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextField(
                      controller: _nameEditingController,
                      decoration: (InputDecoration(hintText: 'Name')),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: _quantityController,
                      decoration: (InputDecoration(hintText: 'Quantity')),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (itemkey == null) {
                            _createItemInHive({
                              "name": _nameEditingController.text,
                              "quantity": _quantityController.text
                            });
                          }
                          if (itemkey != null) {
                            _updateItemInHive(itemkey, {
                              "name": _nameEditingController.text,
                              "quantity": _quantityController.text
                            });
                          }
                        },
                        child: Text(itemkey == null ? "Create New" : "Update"))
                  ],
                ),
              ),
            ));
  }
}
