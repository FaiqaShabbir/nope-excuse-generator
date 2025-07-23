import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../models/excuse.dart';

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
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w600,
                color: const Color(0xFF1E293B),
                height: 1.4,
              ),
              textAlign: TextAlign.center,
            ),
          ).animate().fadeIn(duration: 800.ms).scale(begin: const Offset(0.8, 0.8)),

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
    ).animate().fadeIn(delay: 200.ms, duration: 600.ms).slideY(begin: 0.3);
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