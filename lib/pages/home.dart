import 'package:flutter/material.dart';
import 'package:flutter_wish_list/pages/app_menu.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatefulWidget {
  const Home({super.key,});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _userInput = "";
  
  @override
  void initState() {
    super.initState();
  }

  void _menuOpen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => AppMenu())
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.yellow[900],
        foregroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
          },
          icon: Icon(Icons.home_filled)
        ),
        actions: [
          IconButton(
            onPressed: _menuOpen,
            icon: Icon(Icons.menu_outlined))
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('wishes').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) return Text('Нет записей');

          return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                  key: Key(snapshot.data!.docs[index].id),
                  child: Card(
                    child: ListTile(
                      title: Text(snapshot.data!.docs[index].get('title')),
                      trailing: IconButton(
                        onPressed: () {
                          setState(() {
                            FirebaseFirestore.instance.collection('wishes').doc(snapshot.data!.docs[index].id).delete();
                          });
                        },
                        icon: Icon(
                          Icons.delete_sweep,
                          color: Colors.yellow[900],
                        )
                      ),
                    ),
                  ),
                  onDismissed: (direction) {
                    FirebaseFirestore.instance.collection('wishes').doc(snapshot.data!.docs[index].id).delete();
                  },
                );
              },
            );
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(context: context, builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Добавьте пожелание'),
              content: TextField(
                onChanged: (String value) {
                  _userInput = value;
                },
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    FirebaseFirestore.instance.collection('wishes').add({'title': _userInput});

                    Navigator.of(context).pop();
                  },
                  child: Text('Добавить')
                )
              ],
            );
          });
        },
        shape: CircleBorder(),
        child: Icon(Icons.add, size: 30,),
      ),
    );
  }
}
