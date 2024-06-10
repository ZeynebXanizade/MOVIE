import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/favorite_services.dart';

final favoritesServiceProvider = Provider<FavoritesService>((ref) {
  return FavoritesService();
});

final favoriteMoviesProvider = StateNotifierProvider<FavoriteMoviesNotifier, List<int>>((ref) {
  return FavoriteMoviesNotifier(ref.read(favoritesServiceProvider));
});

class FavoriteMoviesNotifier extends StateNotifier<List<int>> {
  final FavoritesService _favoritesService;

  FavoriteMoviesNotifier(this._favoritesService) : super([]) {
    _loadFavorites();
  }

  void _loadFavorites() async {
    state = await _favoritesService.getFavoriteMovies();
  }

  void toggleFavorite(int movieId) async {
    await _favoritesService.toggleFavorite(movieId);
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