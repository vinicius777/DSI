
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Band Name Survey",
      theme: ThemeData(
        primarySwatch: Colors.green
      ),
      home: const MyHomePage(title: 'Possible Band Names')
    );
  }
}
class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key, this.title}) : super(key:key);

  final String title;

  Widget _buildListItem(BuildContext context, DocumentSnapshot document){
    return ListTile(
      title: Row(
        children: [
          Expanded(
            child: Text(
              document['name'],
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Color(0xffddddf),
            ),
            padding: EdgeInsets.all(10.0),
            child: Text(
              document['votes'].toString(),
              style: Theme.of(context).textTheme.headline4,
            ),
          )
        ],
      ),
      onTap: (){
        print("Should increase votes here");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Possible Band Names"),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('bandnames').snapshots(),
        builder: (context, snapshot) {
          if(!snapshot.hasData)return Text('Loading...');
          return ListView.builder(
            itemExtent: 80.0,
            itemCount: snapshot.data.documents.lenght,
            itemBuilder: (context, index)=>
            _buildListItem(context, snapshot.data.documents[index]),
          );
        }

      ),
    );
  }
}

