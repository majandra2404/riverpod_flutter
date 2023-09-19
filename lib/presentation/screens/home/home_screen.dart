import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('River App')),
      ),
      body: const _HomeScreen(),
    );
  }
}

class _HomeScreen extends StatelessWidget {
  const _HomeScreen();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        _CustomListTile(
            title: 'State Provider',
            subTitle: 'Un estado simple',
            location: '/state-provider'),
        _CustomListTile(
            title: 'Future provider',
            subTitle: 'Un estado simple + family',
            location: '/future-provider'),
        _CustomListTile(
            title: 'Stream provider',
            subTitle: '',
            location: '/stream-provider'),
        _CustomListTile(
            title: 'State Notifier Provider',
            subTitle: '',
            location: '/state-notifier-provider'),
      ],
    );
  }
}

class _CustomListTile extends StatelessWidget {
  final String title;
  final String subTitle;
  final String location;
  const _CustomListTile(
      {required this.title, required this.subTitle, required this.location});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      trailing: const Icon(Icons.arrow_forward_ios_rounded),
      onTap: () => context.push(location),
    );
  }
}
