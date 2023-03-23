import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _switchValue = false;
  String? _radioValue = "A";
  final _textFieldController = TextEditingController();
  bool _checkBoxValue = false;

  void _showSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("This is a snackbar!"),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _showAlertDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Alert"),
          content: Text("This is an alert dialog!"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Demo"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text("Drawer Header"),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text("Drawer Item 1"),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              title: Text("Drawer Item 2"),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Switch(
                  value: _switchValue,
                  onChanged: (value) => setState(() => _switchValue = value),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio(
                      value: "A",
                      groupValue: _radioValue,
                      onChanged: (value) =>
                          setState(() => _radioValue = value as String),
                    ),
                    Text("A"),
                    Radio(
                      value: "B",
                      groupValue: _radioValue,
                      onChanged: (value) =>
                          setState(() => _radioValue = value as String),
                    ),
                    Text("B"),
                    Radio(
                      value: "C",
                      groupValue: _radioValue,
                      onChanged: (value) =>
                          setState(() => _radioValue = value as String),
                    ),
                    Text("C"),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextField(
                    controller: _textFieldController,
                  ),
                ),
                Checkbox(
                  value: _checkBoxValue,
                  onChanged: (value) => setState(() => _checkBoxValue = value!),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.favorite),
                      onPressed: (){}
                    ),
                    Switch(
                      value: _switchValue,
                      onChanged: (value) =>
                          setState(() => _switchValue = value),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text("Show Alert Dialog"),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("Show Snack Bar"),
                    ),
                  ],
                ),
                SizedBox(
                  height: 500,
                  child: ListView.builder(
                    itemCount: 20,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text("Item $index"),
                        subtitle: Text("Subtitle $index"),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 5000,
                  child: GridView.count(
                    crossAxisCount: 2,
                    children: List.generate(6, (index) {
                      return Card(
                        child: Center(
                          child: Text("Item $index"),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
