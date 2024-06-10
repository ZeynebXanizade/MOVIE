import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../global/const/colors.dart';
import '../../presentation/providers/favorite_provider.dart';

class FavoriteScreen extends ConsumerWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteMovies = ref.watch(favoriteMoviesProvider);
    final favoriteMoviesNotifier = ref.watch(favoriteMoviesProvider.notifier);

    return Scaffold(
      body: Column(children: [
        IconButton(
          icon: Icon(
            Icons.delete_forever,
            color: ConstantColor.whiteColor,
          ),
          onPressed: () {
            favoriteMoviesNotifier.clearFavorites();
          },
        ),
        favoriteMovies.isEmpty
            ? Center(
                child: Text('No favorites yet'),
              )
            : ListView.builder(
                shrinkWrap: true,
                itemCount: favoriteMovies.length,
                itemBuilder: (context, index) {
                  final movie = favoriteMovies[index];
                  return ListTile(
                    leading: Image.network("https://image.tmdb.org/t/p/w500${movie['posterPath']}"),
                    title: Text(movie['title'] ?? 'Unknown'),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        favoriteMoviesNotifier.removeFavorite(int.parse(movie['id']!));
                      },
                    ),
                  );
                },
              ),
      ]),
    );
  }
}
