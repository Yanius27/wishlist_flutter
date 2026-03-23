import 'package:flutter_html/flutter_html.dart';

import 'package:flutter/material.dart';
import 'package:flutter_wish_list/pages/app_menu.dart';

class About extends StatelessWidget {
  final String message = 'Frontend-разработчик с коммерческим опытом ~2 лет.<br><br>Специализируюсь на разработке SPA и SSR-приложений на React / Next.js с использованием TypeScript.<br><br>А это мой первый flutter-проект, так что не судите строго:)<br><br><br><b>Ключевые навыки</b>:<br><br>React, Next.js, TypeScript, JavaScript<br>Redux Toolkit, Zustand, TanStack Query<br>CSS, SCSS, Tailwind<br>REST, GraphQL<br>Git, Jira, Figma';

  const About({super.key});

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
        title: Text('Обо мне'),
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
              onPressed: () => _menuOpen(context),
              icon: Icon(Icons.menu_outlined))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 65,
              backgroundImage: AssetImage('assets/1.jpg'),
            ),
            SizedBox(height: 20),
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 500),
              child: Html(
                data: message,
                style: {
                  "body": Style(
                    color: Colors.white,
                    textAlign: TextAlign.center,
                    fontSize: FontSize(17),
                    fontFamily: 'Gantari'
                  ),
                }
              ),
            )
          ],
        )
      ),
    );
  }
}
