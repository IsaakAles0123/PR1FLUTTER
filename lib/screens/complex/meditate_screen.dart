import 'package:flutter/material.dart';
import '../../theme.dart';
import '../../widgets/illustrations.dart';

class MeditateScreen extends StatefulWidget {
  const MeditateScreen({super.key});

  @override
  State<MeditateScreen> createState() => _MeditateScreenState();
}

class _MeditateScreenState extends State<MeditateScreen> {
  int selectedChip = 0;
  final chips = const ['All', 'Bible In a Year', 'Dailies', 'Minutes', 'November'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
          children: [
            Row(
              children: [
                const Expanded(
                  child: Text(
                    'Meditate',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.w800),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search, size: 28),
                ),
              ],
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 42,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: chips.length,
                separatorBuilder: (_, _) => const SizedBox(width: 10),
                itemBuilder: (context, index) {
                  final selected = selectedChip == index;
                  return ChoiceChip(
                    label: Text(chips[index]),
                    selected: selected,
                    onSelected: (_) => setState(() => selectedChip = index),
                    selectedColor: AppColors.tealDark,
                    backgroundColor: AppColors.chipBg,
                    showCheckmark: false,
                    labelStyle: TextStyle(
                      color: selected ? Colors.white : AppColors.chipText,
                      fontWeight: FontWeight.w600,
                    ),
                    shape: const StadiumBorder(),
                    side: BorderSide.none,
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  );
                },
              ),
            ),
            const SizedBox(height: 18),
            const SizedBox(height: 170, child: SunMoonCardArt()),
            const SizedBox(height: 14),
            const Text(
              'A Song of Moon',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 4),
            const Text(
              'Start with the basics',
              style: TextStyle(color: AppColors.textMuted, fontSize: 15),
            ),
            const SizedBox(height: 8),
            const Row(
              children: [
                Icon(Icons.favorite_border, size: 16, color: AppColors.textMuted),
                SizedBox(width: 6),
                Text('9 Sessions', style: TextStyle(color: AppColors.textMuted)),
                Spacer(),
                Text('Start  >', style: TextStyle(color: AppColors.textMuted, fontWeight: FontWeight.w600)),
              ],
            ),
            const SizedBox(height: 18),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: _GridCard(
                    art: SleepHourArt(),
                    title: 'The Sleep Hour',
                    author: 'Ashna Mukherjee',
                    meta: '3 Sessions',
                  ),
                ),
                SizedBox(width: 14),
                Expanded(
                  child: _GridCard(
                    art: EasyMissionArt(),
                    title: 'Easy on the Mission',
                    author: 'Peter Mach',
                    meta: '5 minutes',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: _GridCard(
                    art: RelaxWithMeArt(),
                    title: 'Relax with Me',
                    author: 'Amanda James',
                    meta: '3 Sessions',
                  ),
                ),
                SizedBox(width: 14),
                Expanded(
                  child: _GridCard(
                    art: SunEnergyArt(),
                    title: 'Sun and Energy',
                    author: 'Micheal Hiu',
                    meta: '5 minutes',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _GridCard extends StatelessWidget {
  const _GridCard({
    required this.art,
    required this.title,
    required this.author,
    required this.meta,
  });

  final Widget art;
  final String title;
  final String author;
  final String meta;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 110, child: art),
        const SizedBox(height: 10),
        Text(title, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 15)),
        const SizedBox(height: 2),
        Text(author, style: const TextStyle(color: AppColors.textMuted, fontSize: 13)),
        const SizedBox(height: 6),
        Row(
          children: [
            const Icon(Icons.favorite_border, size: 14, color: AppColors.textMuted),
            const SizedBox(width: 4),
            Expanded(
              child: Text(meta, style: const TextStyle(color: AppColors.textMuted, fontSize: 12)),
            ),
            const Text('Start  >', style: TextStyle(color: AppColors.textMuted, fontSize: 12, fontWeight: FontWeight.w600)),
          ],
        ),
      ],
    );
  }
}
