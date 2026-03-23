import 'package:flutter/material.dart';
import 'package:flutter_wish_list/pages/app_menu.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  void _menuOpen(BuildContext context) {
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
        title: Text('Wish List'),
        centerTitle: true,
        backgroundColor: Colors.yellow[900],
        foregroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () => _menuOpen(context),
              icon: Icon(Icons.menu_outlined))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Список подарков:', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black87),),
            Padding(padding: EdgeInsets.only(bottom: 20)),
            InkWell(
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(context, '/kate_wishes', (route) => false);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.wallet_giftcard_sharp, color: Colors.yellow[900]),
                  Padding(padding: EdgeInsets.only(right: 5)),
                  SizedBox(width: 8,),
                  Text('для Кати', style: TextStyle(fontSize: 20, color: Colors.white))
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 10)),
            InkWell(
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(context, '/yan_wishes', (route) => false);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.wallet_giftcard_sharp, color: Colors.yellow[900]),
                  Padding(padding: EdgeInsets.only(right: 5)),
                  SizedBox(width: 8,),
                  Text('для Яна', style: TextStyle(fontSize: 20, color: Colors.white))
                ],
              ),
            ),
          ],
        )
      )
    );
  }
}
