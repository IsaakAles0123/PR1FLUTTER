import 'package:flutter/material.dart';
import '../../theme.dart';
import '../../widgets/illustrations.dart';

class AtlantisScreen extends StatelessWidget {
  const AtlantisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.38,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                const Positioned.fill(child: AtlantisHeaderArt()),
                Positioned(
                  top: MediaQuery.paddingOf(context).top + 8,
                  left: 16,
                  child: CircleAvatar(
                    backgroundColor: Colors.white.withValues(alpha: 0.85),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new, size: 18, color: Colors.black87),
                      onPressed: () => Navigator.maybePop(context),
                    ),
                  ),
                ),
                Positioned(
                  bottom: -36,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Container(
                      width: 78,
                      height: 78,
                      decoration: const BoxDecoration(
                        color: AppColors.playOrange,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.play_arrow_rounded, color: Colors.white, size: 48),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 48),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
              children: [
                const Text(
                  'Secrets of Atlantis',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 12),
                Center(
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.followOrange,
                      side: const BorderSide(color: AppColors.followOrange, width: 1.4),
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 8),
                    ),
                    child: const Text('Follow', style: TextStyle(fontWeight: FontWeight.w700)),
                  ),
                ),
                const SizedBox(height: 18),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.hostCard,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CircleAvatar(
                              radius: 26,
                              backgroundColor: Color(0xFFE38BBE),
                              child: Icon(Icons.face, color: Colors.white),
                            ),
                            const SizedBox(width: 10),
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Codin',
                                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 16),
                                  ),
                                  Text('Host', style: TextStyle(color: Color(0xFFC5B8E8), fontSize: 12)),
                                ],
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Expanded(
                              flex: 2,
                              child: Text(
                                'The Secrets of Atlantis podcast is designed for all fantasy enthusiasts, everything from debunking underwater... see more',
                                style: TextStyle(color: Colors.white, height: 1.35, fontSize: 13),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(16, 0, 16, 12),
                        child: Row(
                          children: [
                            Icon(Icons.star, color: Colors.white, size: 16),
                            SizedBox(width: 4),
                            Text('4.8  (10)', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                            SizedBox(width: 12),
                            _Tag('Fantasy'),
                            Spacer(),
                            Icon(Icons.notifications_none, color: Colors.white70),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(16, 12, 16, 14),
                        decoration: const BoxDecoration(
                          color: AppColors.hostCardBottom,
                          borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 92,
                              height: 32,
                              child: Stack(
                                children: [
                                  for (var i = 0; i < 3; i++)
                                    Positioned(
                                      left: i * 18.0,
                                      child: CircleAvatar(
                                        radius: 14,
                                        backgroundColor: [const Color(0xFF8D6E63), const Color(0xFF90CAF9), const Color(0xFFCE93D8)][i],
                                      ),
                                    ),
                                  const Positioned(
                                    left: 54,
                                    child: CircleAvatar(
                                      radius: 14,
                                      backgroundColor: AppColors.playOrange,
                                      child: Text('+10', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w700)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            const Icon(Icons.wifi_tethering, color: Color(0xFFFF5A1F), size: 18),
                            const SizedBox(width: 6),
                            const Text(
                              'Live',
                              style: TextStyle(color: Color(0xFFFF5A1F), fontWeight: FontWeight.w800),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 18),
                Container(
                  height: 84,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: AppColors.inviteYellow,
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 72,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Positioned(
                              left: 0,
                              child: CircleAvatar(
                                radius: 22,
                                backgroundColor: AppColors.playOrange,
                                child: const Text(':) ', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800)),
                              ),
                            ),
                            Positioned(
                              right: 0,
                              child: Container(
                                width: 44,
                                height: 44,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF4DA6FF),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: Colors.white, width: 3),
                                ),
                                child: const Icon(Icons.sentiment_satisfied_alt, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Expanded(
                        child: Text(
                          'Invite your\nfriends to join',
                          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16, height: 1.15),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.share_outlined),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Tag extends StatelessWidget {
  const _Tag(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFF2C1C5C),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600)),
    );
  }
}
