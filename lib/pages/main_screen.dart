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
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 450), // Ограничиваем ширину до 450px
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Text(
                  'Привет! Это приложение - удобный список, в который вы можете добавить то, что давно хотели себе купить, но никак не доходили руки. А ваши друзья и близкие смогут в него заглянуть и порадовать вас по случаю какого-нибудь праздника или просто так',
                  style: const TextStyle(fontSize: 14, fontFamily: 'Gantari', color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(context, '/wishes', (route) => false);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.arrow_circle_right_rounded, color: Colors.yellow[900]),
                  Padding(padding: EdgeInsets.only(right: 5)),
                  SizedBox(width: 8,),
                  Text('К списку желаний', style: TextStyle(fontSize: 20, color: Colors.white))
                ],
              ),
            ),
          ],
        )
      )
    );
  }
}
