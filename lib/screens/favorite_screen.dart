import 'package:flutter/material.dart';
import 'package:empty_app_test2/providers/app_state.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();

    if (appState.favorites.isEmpty) {
      return const Center(
        child: Text('No favorites yet.'),
      );
    }

    return ListView.builder(
      itemCount: appState.favorites.length,
      itemBuilder: (context, index) {
        var pair = appState.favorites[index];
        return ListTile(
          leading: Icon(Icons.favorite, color: Colors.red), // Warna merah untuk ikon hati
          title: Text(pair.asLowerCase),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              // Panggil metode removeFavorite saat tombol hapus ditekan
              appState.removeFavorite(pair);
            },
          ),
        );
      },
    );
  }
}
