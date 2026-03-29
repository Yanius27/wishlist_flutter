import 'package:flutter/material.dart';

class AppMenu extends StatelessWidget {
  const AppMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: Text('Меню'),
          centerTitle: true,
          backgroundColor: Colors.yellow[900],
          foregroundColor: Colors.white,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               _menuItem(
                 context,
                 route: '/',
                 icon: Icons.home_filled,
                 text: 'На главную'
               ),
              _menuItem(
                context,
                route: '/wishes',
                icon: Icons.wallet_giftcard_outlined,
                text: 'Список желаний'
              ),
              _menuItem(
                context,
                route: '/about',
                icon: Icons.person,
                text: 'Обо мне'
              )
            ],
          ),
        )
    );
  }
}

Widget _menuItem(BuildContext context, {required String route, required IconData icon, required String text}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child:  InkWell(
      onTap: () {
        Navigator.pushNamedAndRemoveUntil(context, route, (route) => false);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.blue[900]),
          SizedBox(width: 8,),
          Text(text, style: TextStyle(fontSize: 22, color: Colors.black87))
        ],
      ),
    ),
  );
}
