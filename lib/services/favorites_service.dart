import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/excuse.dart';

class FavoritesService {
  static const String _favoritesKey = 'favorite_excuses';

  static Future<List<Excuse>> getFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favoritesJson = prefs.getStringList(_favoritesKey) ?? [];
    
    return favoritesJson
        .map((json) => Excuse.fromJson(jsonDecode(json)))
        .toList();
  }

  static Future<void> addFavorite(Excuse excuse) async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = await getFavorites();
    
    // Check if already exists
    if (!favorites.any((fav) => fav.text == excuse.text)) {
      favorites.add(excuse);
      final favoritesJson = favorites
          .map((excuse) => jsonEncode(excuse.toJson()))
          .toList();
      await prefs.setStringList(_favoritesKey, favoritesJson);
    }
  }

  static Future<void> removeFavorite(Excuse excuse) async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = await getFavorites();
    
    favorites.removeWhere((fav) => fav.text == excuse.text);
    final favoritesJson = favorites
        .map((excuse) => jsonEncode(excuse.toJson()))
        .toList();
    await prefs.setStringList(_favoritesKey, favoritesJson);
  }

  static Future<bool> isFavorite(Excuse excuse) async {
    final favorites = await getFavorites();
    return favorites.any((fav) => fav.text == excuse.text);
  }

  static Future<void> clearFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_favoritesKey);
  }
} 