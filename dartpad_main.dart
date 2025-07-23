import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';

void main() {
  runApp(const NopeApp());
}

class NopeApp extends StatelessWidget {
  const NopeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nope!',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6366F1),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        fontFamily: 'Inter',
      ),
      home: const HomeScreen(),
    );
  }
}

// Data Models
class Excuse {
  final String text;
  final String category;

  Excuse({required this.text, required this.category});
}

class Category {
  final String id;
  final String name;
  final String emoji;

  Category({required this.id, required this.name, required this.emoji});
}

// Embedded Data
class ExcuseData {
  static final List<Excuse> excuses = [
    Excuse(text: "I can't come, my cat just started therapy.", category: "general"),
    Excuse(text: "I'm currently in a staring contest with my ceiling fan.", category: "general"),
    Excuse(text: "My plants are emotionally dependent on me today.", category: "general"),
    Excuse(text: "I got trapped under my blanket and it's a trust issue now.", category: "general"),
    Excuse(text: "Mercury is in reverse gear again.", category: "general"),
    Excuse(text: "I can't go out — my WiFi needs me.", category: "general"),
    Excuse(text: "My stomach is full of regret and biryani.", category: "general"),
    Excuse(text: "I'm currently negotiating with my bed about getting up.", category: "general"),
    Excuse(text: "My phone battery is at 1% and I'm emotionally attached to it.", category: "general"),
    Excuse(text: "I'm in the middle of a very important conversation with my reflection.", category: "general"),
    Excuse(text: "My Netflix account is having separation anxiety.", category: "general"),
    Excuse(text: "I'm currently being held hostage by my couch.", category: "general"),
    Excuse(text: "My brain is currently updating to version 2.0.", category: "general"),
    Excuse(text: "I'm in a committed relationship with my pajamas right now.", category: "general"),
    Excuse(text: "My motivation is currently on vacation in Bali.", category: "work"),
    Excuse(text: "My laptop is having an existential crisis.", category: "work"),
    Excuse(text: "I'm currently debugging my life choices.", category: "work"),
    Excuse(text: "My coffee hasn't kicked in yet, and neither have I.", category: "work"),
    Excuse(text: "I'm in a meeting with my inner procrastinator.", category: "work"),
    Excuse(text: "My productivity is currently loading...", category: "work"),
    Excuse(text: "I'm experiencing technical difficulties with my motivation.", category: "work"),
    Excuse(text: "My brain is currently in airplane mode.", category: "work"),
    Excuse(text: "I'm currently rebooting my work ethic.", category: "work"),
    Excuse(text: "My gym clothes are still in the dryer from last week.", category: "gym"),
    Excuse(text: "I'm currently in a relationship with my couch.", category: "gym"),
    Excuse(text: "My motivation is currently on a coffee break.", category: "gym"),
    Excuse(text: "I'm currently doing mental reps.", category: "gym"),
    Excuse(text: "My gym membership is having trust issues.", category: "gym"),
    Excuse(text: "I'm currently working on my inner strength.", category: "gym"),
    Excuse(text: "My workout is currently buffering.", category: "gym"),
    Excuse(text: "I'm currently doing research on the benefits of rest days.", category: "gym"),
    Excuse(text: "My family is currently having a group therapy session.", category: "family"),
    Excuse(text: "I'm currently mediating between my siblings.", category: "family"),
    Excuse(text: "My mom is having a crisis about my life choices.", category: "family"),
    Excuse(text: "I'm currently explaining to my parents what I do for a living.", category: "family"),
    Excuse(text: "My family is currently having an intervention for my phone addiction.", category: "family"),
    Excuse(text: "I'm currently being interrogated about my dating life.", category: "family"),
    Excuse(text: "My parents are currently having a meeting about my future.", category: "family"),
    Excuse(text: "I'm currently in a staring contest with my ex's Instagram.", category: "dating"),
    Excuse(text: "My dating life is currently under maintenance.", category: "dating"),
    Excuse(text: "I'm currently having a conversation with my dating apps.", category: "dating"),
    Excuse(text: "My heart is currently updating its privacy settings.", category: "dating"),
    Excuse(text: "I'm currently doing research on healthy relationships.", category: "dating"),
    Excuse(text: "My love life is currently in beta testing.", category: "dating"),
    Excuse(text: "I'm currently having a meeting with my inner romantic.", category: "dating"),
    Excuse(text: "My social battery is currently at 1%.", category: "social"),
    Excuse(text: "I'm currently in a relationship with my introvert side.", category: "social"),
    Excuse(text: "My social skills are currently updating.", category: "social"),
    Excuse(text: "I'm currently having a conversation with my anxiety.", category: "social"),
    Excuse(text: "My people skills are currently in airplane mode.", category: "social"),
    Excuse(text: "I'm currently doing research on human interaction.", category: "social"),
    Excuse(text: "My conversation skills are currently buffering.", category: "social"),
    Excuse(text: "I'm currently having a meeting with my inner extrovert.", category: "social"),
    Excuse(text: "My wallet is currently on a diet.", category: "money"),
    Excuse(text: "I'm currently having a conversation with my bank account.", category: "money"),
    Excuse(text: "My budget is currently in therapy.", category: "money"),
    Excuse(text: "I'm currently doing research on financial responsibility.", category: "money"),
    Excuse(text: "My money is currently on vacation.", category: "money"),
    Excuse(text: "I'm currently having a meeting with my inner accountant.", category: "money"),
    Excuse(text: "My savings account is currently having trust issues.", category: "money"),
    Excuse(text: "I'm currently in a relationship with my overdraft.", category: "money"),
  ];

  static final List<Category> categories = [
    Category(id: "all", name: "All Excuses", emoji: "🎲"),
    Category(id: "general", name: "General", emoji: "🤷‍♂️"),
    Category(id: "work", name: "Work", emoji: "💼"),
    Category(id: "gym", name: "Gym", emoji: "💪"),
    Category(id: "family", name: "Family", emoji: "👨‍👩‍👧‍👦"),
    Category(id: "dating", name: "Dating", emoji: "💕"),
    Category(id: "social", name: "Social", emoji: "🎉"),
    Category(id: "money", name: "Money", emoji: "💰"),
  ];

  static List<Excuse> getExcuses({String? category}) {
    if (category == null || category == 'all') {
      return List.from(excuses);
    }
    return excuses.where((excuse) => excuse.category == category).toList();
  }

  static Excuse getRandomExcuse({String? category}) {
    final filteredExcuses = getExcuses(category: category);
    if (filteredExcuses.isEmpty) {
      return Excuse(text: "No excuses available!", category: "general");
    }
    final random = Random();
    return filteredExcuses[random.nextInt(filteredExcuses.length)];
  }
}

// Main Screen
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  Excuse? _currentExcuse;
  String _selectedCategory = 'all';
  List<Excuse> _favorites = [];
  late AnimationController _shakeController;

  @override
  void initState() {
    super.initState();
    _shakeController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _generateNewExcuse();
  }

  @override
  void dispose() {
    _shakeController.dispose();
    super.dispose();
  }

  void _generateNewExcuse() {
    setState(() {
      _currentExcuse = ExcuseData.getRandomExcuse(category: _selectedCategory);
    });
    _shakeController.forward().then((_) => _shakeController.reset());
  }

  void _onCategoryChanged(String category) {
    setState(() {
      _selectedCategory = category;
    });
    _generateNewExcuse();
  }

  void _toggleFavorite() {
    if (_currentExcuse != null) {
      setState(() {
        if (_favorites.any((fav) => fav.text == _currentExcuse!.text)) {
          _favorites.removeWhere((fav) => fav.text == _currentExcuse!.text);
        } else {
          _favorites.add(_currentExcuse!);
        }
      });
    }
  }

  bool _isFavorite() {
    return _currentExcuse != null && 
           _favorites.any((fav) => fav.text == _currentExcuse!.text);
  }

  void _shareExcuse() {
    if (_currentExcuse != null) {
      // In DartPad, we'll just show a snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Shared: ${_currentExcuse!.text}'),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  void _copyToClipboard() {
    if (_currentExcuse != null) {
      Clipboard.setData(ClipboardData(text: _currentExcuse!.text));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Excuse copied to clipboard! 📋'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Nope!',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1E293B),
                        ),
                      ),
                      const Text(
                        'Excuse Generator',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF64748B),
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FavoritesScreen(favorites: _favorites),
                        ),
                      );
                    },
                    icon: const Icon(Icons.favorite, color: Color(0xFFEF4444)),
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.white,
                      elevation: 2,
                    ),
                  ),
                ],
              ),
            ),

            // Category Selector
            CategorySelector(
              selectedCategory: _selectedCategory,
              onCategoryChanged: _onCategoryChanged,
            ),

            const SizedBox(height: 20),

            // Main Excuse Card
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: _currentExcuse == null
                    ? const Center(child: CircularProgressIndicator())
                    : ExcuseCard(
                        excuse: _currentExcuse!,
                        isFavorite: _isFavorite(),
                        onToggleFavorite: _toggleFavorite,
                        onShare: _shareExcuse,
                        onCopy: _copyToClipboard,
                      ),
              ),
            ),

            // Generate Button
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: _generateNewExcuse,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6366F1),
                    foregroundColor: Colors.white,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.shuffle, size: 24),
                      SizedBox(width: 12),
                      Text(
                        'GIVE ME AN EXCUSE',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Category Selector Widget
class CategorySelector extends StatelessWidget {
  final String selectedCategory;
  final Function(String) onCategoryChanged;

  const CategorySelector({
    super.key,
    required this.selectedCategory,
    required this.onCategoryChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: ExcuseData.categories.length,
        itemBuilder: (context, index) {
          final category = ExcuseData.categories[index];
          final isSelected = selectedCategory == category.id;
          
          return Container(
            margin: const EdgeInsets.only(right: 12),
            child: GestureDetector(
              onTap: () => onCategoryChanged(category.id),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: isSelected ? const Color(0xFF6366F1) : Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: isSelected ? const Color(0xFF6366F1) : const Color(0xFFE2E8F0),
                    width: 2,
                  ),
                  boxShadow: isSelected ? [
                    BoxShadow(
                      color: const Color(0xFF6366F1).withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ] : null,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      category.emoji,
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      category.name,
                      style: TextStyle(
                        color: isSelected ? Colors.white : const Color(0xFF64748B),
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// Excuse Card Widget
class ExcuseCard extends StatelessWidget {
  final Excuse excuse;
  final bool isFavorite;
  final VoidCallback onToggleFavorite;
  final VoidCallback onShare;
  final VoidCallback onCopy;

  const ExcuseCard({
    super.key,
    required this.excuse,
    required this.isFavorite,
    required this.onToggleFavorite,
    required this.onShare,
    required this.onCopy,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Excuse Text
          Padding(
            padding: const EdgeInsets.all(32),
            child: Text(
              excuse.text,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1E293B),
                height: 1.4,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          const SizedBox(height: 20),

          // Action Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Favorite Button
              _ActionButton(
                icon: isFavorite ? Icons.favorite : Icons.favorite_border,
                label: 'Save',
                color: isFavorite ? const Color(0xFFEF4444) : const Color(0xFF64748B),
                onTap: onToggleFavorite,
              ),

              // Share Button
              _ActionButton(
                icon: Icons.share,
                label: 'Share',
                color: const Color(0xFF6366F1),
                onTap: onShare,
              ),

              // Copy Button
              _ActionButton(
                icon: Icons.copy,
                label: 'Copy',
                color: const Color(0xFF10B981),
                onTap: onCopy,
              ),
            ],
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _ActionButton({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Favorites Screen
class FavoritesScreen extends StatelessWidget {
  final List<Excuse> favorites;

  const FavoritesScreen({super.key, required this.favorites});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text(
          'Favorites',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF1E293B),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1E293B)),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: favorites.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite_border,
                    size: 80,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No favorites yet!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Save your favorite excuses here',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final excuse = favorites[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      excuse.text,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF1E293B),
                        height: 1.4,
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
} 