import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home';

  const HomePage({super.key});


  @override
  Widget build(BuildContext context) {
    final String username = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return HomeMobilePage(username: username,);
          } else {
            return DesktopHomeScreen(username: username,);
          }
        },
      ),
    );
  }
}

class HomeMobilePage extends StatelessWidget {
  final String username;
  const HomeMobilePage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: Icon(
              Icons.account_circle,
              size: 50,
              color: Colors.grey[700],
            ),
            title: username.isNotEmpty
                ? Text('Hi, $username')
                : const Text('Hi, Guest!'),
            actions: [
              IconButton(onPressed: (){}, icon: Icon(Icons.notifications, color: Colors.grey[700],)),
              IconButton(
                icon: const Icon(Icons.logout),
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/login', (route) => false);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DesktopHomeScreen extends StatelessWidget {
  final String username;
  const DesktopHomeScreen({super.key, required this.username});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Desktop')),
      body: const Center(child: Text('This is the desktop home page')),
    );
  }
}
