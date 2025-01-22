import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';

class FavoritesPage extends StatefulWidget {
  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var color = Colors.primaries[Random().nextInt(Colors.primaries.length)];

    return  Center(
      child: ListView(
        children: [
          AppBar(
            backgroundColor: color,
            title: Padding(
            padding: const EdgeInsets.all(20),
            child: Text('You have '
                '${appState.favorites.length} favorites:'),
                    ),
            elevation: 0,
            actions: [
              IconButton(onPressed: () => appState.getNext(),
              icon: Icon(Icons.color_lens))
            ],
          ),

          for(var msg in appState.favorites)
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text(msg.asSnakeCase),
              
              ),

        ]
      )
    );
  }
}