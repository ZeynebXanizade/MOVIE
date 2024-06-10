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

  Future<void> removeFavorite(int movieId) async {
    final prefs = await SharedPreferences.getInstance();
    final favoriteMovies = prefs.getStringList(_favoritesKey) ?? [];
    favoriteMovies.remove(movieId.toString());
    await prefs.setStringList(_favoritesKey, favoriteMovies);
  }

  Future<void> clearFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_favoritesKey);
  }
}