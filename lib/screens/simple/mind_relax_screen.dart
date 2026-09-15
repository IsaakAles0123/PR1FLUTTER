import 'package:flutter/material.dart';
import '../../theme.dart';
import '../../widgets/illustrations.dart';

class MindRelaxScreen extends StatelessWidget {
  const MindRelaxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
          children: [
            const SizedBox(
              height: 210,
              child: FigmaImage('assets/images/mind_relax.png', radius: 20),
            ),
            const SizedBox(height: 22),
            const Text(
              'Peter Mach',
              style: TextStyle(color: AppColors.textMuted, fontSize: 14),
            ),
            const SizedBox(height: 4),
            const Text(
              'Mind Deep Relax',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w800,
                color: AppColors.textDark,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Join the Community as we prepare over 30 days to relax and look inward with the pack and have only 3 sessions per day.',
              style: TextStyle(
                fontSize: 14,
                height: 1.45,
                color: Color(0xFF8A8A8A),
              ),
            ),
            const SizedBox(height: 22),
            SizedBox(
              height: 54,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.play_arrow_rounded, size: 28),
                label: const Text('Play Next Session'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.tealButton,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: const StadiumBorder(),
                  textStyle: const TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ),
            ),
            const SizedBox(height: 18),
            const _SessionTile(
              color: Color(0xFF3D8BFF),
              title: 'Sweet Memories',
              subtitle: 'December 29 Pre-Launch',
            ),
            const _SessionTile(
              color: AppColors.tealButton,
              title: 'A Day Dream',
              subtitle: 'December 29 Pre-Launch',
            ),
            const _SessionTile(
              color: Color(0xFFFF9A3D),
              title: 'Mind Explore',
              subtitle: 'February 29 Pre-Launch',
            ),
          ],
        ),
      ),
    );
  }
}

class _SessionTile extends StatelessWidget {
  const _SessionTile({
    required this.color,
    required this.title,
    required this.subtitle,
  });

  final Color color;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(12)),
            child: const Icon(Icons.play_arrow_rounded, color: Colors.white),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(color: AppColors.textMuted, fontSize: 13),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.play_circle_outline, color: color, size: 28),
          ),
        ],
      ),
    );
  }
}
