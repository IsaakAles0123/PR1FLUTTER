import 'package:flutter/material.dart';
import '../theme.dart';
import 'complex/atlantis_screen.dart';
import 'complex/meditate_screen.dart';
import 'simple/medinow_screen.dart';
import 'simple/mind_relax_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Практическая работа №1',
            style: TextStyle(fontWeight: FontWeight.w800),
          ),
          bottom: const TabBar(
            labelColor: AppColors.tealDark,
            unselectedLabelColor: AppColors.textMuted,
            indicatorColor: AppColors.tealDark,
            tabs: [
              Tab(text: 'Простые макеты'),
              Tab(text: 'Сложные макеты'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            _MockupList(
              title: 'Страница 1 — лёгкие макеты',
              items: [
                _MockupItem(
                  title: 'medinow',
                  subtitle: 'Экран входа. Column, кнопки, иллюстрация',
                  color: AppColors.teal,
                  screen: MedinowScreen(),
                ),
                _MockupItem(
                  title: 'Mind Deep Relax',
                  subtitle: 'Список сессий, кнопка Play, карточка',
                  color: AppColors.tealButton,
                  screen: MindRelaxScreen(),
                ),
              ],
            ),
            _MockupList(
              title: 'Страница 2 — сложные макеты',
              items: [
                _MockupItem(
                  title: 'Meditate',
                  subtitle: 'Чипы, поиск, сетка карточек',
                  color: Color(0xFFF5C63D),
                  screen: MeditateScreen(),
                ),
                _MockupItem(
                  title: 'Secrets of Atlantis',
                  subtitle: 'Stack, карточка ведущего, Live, приглашение',
                  color: AppColors.atlantisDeep,
                  screen: AtlantisScreen(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _MockupItem {
  const _MockupItem({
    required this.title,
    required this.subtitle,
    required this.color,
    required this.screen,
  });

  final String title;
  final String subtitle;
  final Color color;
  final Widget screen;
}

class _MockupList extends StatelessWidget {
  const _MockupList({required this.title, required this.items});

  final String title;
  final List<_MockupItem> items;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 28),
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, color: AppColors.textMuted, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 16),
        for (final item in items) ...[
          _MockupCard(item: item),
          const SizedBox(height: 14),
        ],
      ],
    );
  }
}

class _MockupCard extends StatelessWidget {
  const _MockupCard({required this.item});

  final _MockupItem item;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute<void>(builder: (_) => item.screen),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: item.color,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
                    const SizedBox(height: 4),
                    Text(item.subtitle, style: const TextStyle(color: AppColors.textMuted)),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: AppColors.textMuted),
            ],
          ),
        ),
      ),
    );
  }
}
