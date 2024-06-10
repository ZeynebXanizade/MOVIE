import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_dovie/src/widgets/background_image_widget.dart';
import '../../global/const/colors.dart';
import '../../presentation/providers/favorite_provider.dart';

class FavoriteScreen extends ConsumerWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteMovies = ref.watch(favoriteMoviesProvider);
    final favoriteMoviesNotifier = ref.watch(favoriteMoviesProvider.notifier);

    return BackGroundImageWidget(
      child: Column(children: [
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
                  final movieId = favoriteMovies[index];
                  return ListTile(
                    title: Text('Movie ID: ${movieId}'),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        favoriteMoviesNotifier.removeFavorite(movieId);
                      },
                    ),
                  );
                },
              ),
      ]),
    );
  }
}