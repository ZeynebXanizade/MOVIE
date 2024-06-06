import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesService {
  static const String _favoritesKey = 'favorites';

  Future<void> toggleFavorite(int movieId) async {
    final prefs = await SharedPreferences.getInstance();
    final favoriteMovies = prefs.getStringList(_favoritesKey) ?? [];
    if (favoriteMovies.contains(movieId.toString())) {
      favoriteMovies.remove(movieId.toString());
    } else {
      favoriteMovies.add(movieId.toString());
    }
    await prefs.setStringList(_favoritesKey, favoriteMovies);
  }

  Future<List<int>> getFavoriteMovies() async {
    final prefs = await SharedPreferences.getInstance();
    final favoriteMovies = prefs.getStringList(_favoritesKey) ?? [];
    return favoriteMovies.map((id) => int.parse(id)).toList();
  }

  Future<bool> isFavorite(int movieId) async {
    final prefs = await SharedPreferences.getInstance();
    final favoriteMovies = prefs.getStringList(_favoritesKey) ?? [];
    return favoriteMovies.contains(movieId.toString());
  }
}

final favoritesServiceProvider = Provider<FavoritesService>((ref) {
  return FavoritesService();
});

final favoriteMoviesProvider = FutureProvider<List<int>>((ref) async {
  final service = ref.read(favoritesServiceProvider);
  return service.getFavoriteMovies();
});

final isFavoriteProvider = FutureProvider.family<bool, int>((ref, movieId) async {
  final service = ref.read(favoritesServiceProvider);
  return service.isFavorite(movieId);
});
