import 'package:flutter/material.dart';
import 'package:flutter_wish_list/pages/app_menu.dart';

class Home extends StatefulWidget {
  final String name;
  final List<String> wishes;

  const Home({super.key, required this.name, required this.wishes});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _userInput = "";
  List wishList = [];
  
  @override
  void initState() {
    super.initState();
    
    wishList.addAll(widget.wishes);
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
        title: Text('${widget.name}: желания'),
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
      body: ListView.builder(
        itemCount: wishList.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            key: Key(wishList[index]),
            child: Card(
              child: ListTile(
                title: Text(wishList[index]),
                trailing: IconButton(
                  onPressed: () {
                    setState(() {
                      wishList.removeAt(index);
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
              setState(() {
                wishList.removeAt(index);
              });
            },
          );
        },
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
                    setState(() {
                      wishList.add(_userInput);
                    });

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
