import 'dart:convert';
import 'dart:math';
import 'package:flutter/services.dart';
import '../models/excuse.dart';

class ExcuseService {
  static List<Excuse> _excuses = [];
  static List<Category> _categories = [];
  static bool _isLoaded = false;

  static Future<void> loadExcuses() async {
    if (_isLoaded) return;

    try {
      final String response = await rootBundle.loadString('assets/excuses.json');
      final data = await json.decode(response);
      
      _excuses = (data['excuses'] as List)
          .map((excuse) => Excuse.fromJson(excuse))
          .toList();
      
      _categories = (data['categories'] as List)
          .map((category) => Category.fromJson(category))
          .toList();
      
      _isLoaded = true;
    } catch (e) {
      print('Error loading excuses: $e');
    }
  }

  static List<Excuse> getExcuses({String? category}) {
    if (category == null || category == 'all') {
      return List.from(_excuses);
    }
    return _excuses.where((excuse) => excuse.category == category).toList();
  }

  static List<Category> getCategories() {
    return List.from(_categories);
  }

  static Excuse getRandomExcuse({String? category}) {
    final filteredExcuses = getExcuses(category: category);
    if (filteredExcuses.isEmpty) {
      return Excuse(text: "No excuses available!", category: "general");
    }
    
    final random = Random();
    return filteredExcuses[random.nextInt(filteredExcuses.length)];
  }

  static bool isLoaded() {
    return _isLoaded;
  }
} 