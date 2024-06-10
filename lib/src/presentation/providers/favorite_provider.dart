import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/favorite_services.dart';

final favoritesServiceProvider = Provider<FavoritesService>((ref) {
  return FavoritesService();
});

final favoriteMoviesProvider = StateNotifierProvider<FavoriteMoviesNotifier, List<Map<String, String>>>((ref) {
  return FavoriteMoviesNotifier(ref.read(favoritesServiceProvider));
});

class FavoriteMoviesNotifier extends StateNotifier<List<Map<String, String>>> {
  final FavoritesService _favoritesService;

  FavoriteMoviesNotifier(this._favoritesService) : super([]) {
    _loadFavorites();
  }

  void _loadFavorites() async {
    state = await _favoritesService.getFavoriteMovies();
  }

  void toggleFavorite(int movieId, String title, String posterPath) async {
    await _favoritesService.toggleFavorite(movieId, title, posterPath);
    state = await _favoritesService.getFavoriteMovies();
  }

  void removeFavorite(int movieId) async {
    await _favoritesService.removeFavorite(movieId);
    state = await _favoritesService.getFavoriteMovies();
  }

  void clearFavorites() async {
    await _favoritesService.clearFavorites();
    state = [];
  }
}
