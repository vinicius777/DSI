
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Possible Band Names",
      home: Vote()
    );
  }
}
class Vote extends StatefulWidget {
  @override
  _VoteState createState() => _VoteState();
}

class _VoteState extends State<Vote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Possible Band Names"),
        centerTitle: true,
      ),
    );
  }
}

