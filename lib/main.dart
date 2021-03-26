import 'package:different_dependencies_specific_platform/key_finder.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    KeyFinder keyFinder = KeyFinder();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(keyFinder: keyFinder),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.keyFinder}) : super(key: key);

  final KeyFinder keyFinder;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String key = "MyKey";

  TextEditingController _keyTextController = TextEditingController();
  TextEditingController _valueTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: 200,
        child: Column(
          children: [
            Expanded(
                child: Text(
              '$key / ${widget.keyFinder.getKeyValue(key)}',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            )),
            Expanded(
                child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Key", border: OutlineInputBorder()),
              controller: _keyTextController,
            )),
            Expanded(
                child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Value", border: OutlineInputBorder()),
              controller: _valueTextController,
            )),
            RaisedButton(
              child: Text("Save the data"),
              onPressed: () {
                widget.keyFinder.setKeyValue(
                    _keyTextController.text, _valueTextController.text);

                setState(() {
                  key = _keyTextController.text;
                });
              },
            ),
            RaisedButton(
                child: Text("go to second page"),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => SecondPage(keyFinder: widget.keyFinder,)));
                })
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  final String keyPref = "MyKey";
  final KeyFinder keyFinder;

  const SecondPage({Key key, this.keyFinder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(keyFinder.getKeyValue(keyPref)),
      ),
    );
  }
}
