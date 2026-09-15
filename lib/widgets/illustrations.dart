import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../theme.dart';

class LeafPlant extends StatelessWidget {
  const LeafPlant({super.key, this.color = const Color(0xFF7FD4D1), this.flip = false});

  final Color color;
  final bool flip;

  @override
  Widget build(BuildContext context) {
    return Transform.flip(
      flipX: flip,
      child: CustomPaint(
        size: const Size(70, 110),
        painter: _LeafPainter(color),
      ),
    );
  }
}

class _LeafPainter extends CustomPainter {
  _LeafPainter(this.color);
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    final stem = Paint()
      ..color = color
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(Offset(size.width * 0.45, size.height), Offset(size.width * 0.5, 8), stem);
    Path leaf(double x, double y, double w, double h, double rot) {
      final path = Path()
        ..addOval(Rect.fromCenter(center: Offset(x, y), width: w, height: h));
      final m = Matrix4.identity()
        ..translateByDouble(x, y, 0, 1)
        ..rotateZ(rot)
        ..translateByDouble(-x, -y, 0, 1);
      return path.transform(m.storage);
    }

    canvas.drawPath(leaf(size.width * 0.28, size.height * 0.42, 28, 52, -0.5), paint);
    canvas.drawPath(leaf(size.width * 0.72, size.height * 0.38, 26, 48, 0.55), paint);
    canvas.drawPath(leaf(size.width * 0.5, size.height * 0.22, 22, 40, 0.05), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class MeditatingPerson extends StatelessWidget {
  const MeditatingPerson({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(220, 220),
      painter: _MeditatingPainter(),
    );
  }
}

class _MeditatingPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final shadow = Paint()..color = const Color(0xFF028A8E).withValues(alpha: 0.35);
    canvas.drawOval(Rect.fromCenter(center: Offset(size.width / 2, size.height - 18), width: 150, height: 22), shadow);

    final hair = Paint()..color = const Color(0xFF2B2B2B);
    final skin = Paint()..color = const Color(0xFFFFE0C2);
    final shirt = Paint()..color = Colors.white;
    final pants = Paint()..color = const Color(0xFF1E1E1E);

    // Legs / lotus
    canvas.drawOval(Rect.fromLTWH(28, 145, 70, 36), pants);
    canvas.drawOval(Rect.fromLTWH(122, 145, 70, 36), pants);
    canvas.drawCircle(const Offset(42, 168), 12, skin);
    canvas.drawCircle(Offset(size.width - 42, 168), 12, skin);

    // Body
    final body = Path()
      ..moveTo(78, 108)
      ..quadraticBezierTo(110, 96, 142, 108)
      ..lineTo(150, 158)
      ..quadraticBezierTo(110, 172, 70, 158)
      ..close();
    canvas.drawPath(body, shirt);

    // Arms in namaste
    final armPaint = Paint()
      ..color = skin.color
      ..strokeWidth = 16
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    canvas.drawLine(const Offset(86, 118), const Offset(110, 148), armPaint);
    canvas.drawLine(Offset(size.width - 86, 118), const Offset(110, 148), armPaint);
    canvas.drawCircle(const Offset(110, 150), 10, skin);

    // Head
    canvas.drawCircle(const Offset(110, 62), 32, hair);
    canvas.drawCircle(const Offset(110, 68), 28, skin);
    canvas.drawArc(const Rect.fromLTWH(82, 36, 56, 40), math.pi, math.pi, false, hair);

    final eye = Paint()
      ..color = const Color(0xFF2B2B2B)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(const Rect.fromLTWH(94, 68, 10, 8), 0, math.pi, false, eye);
    canvas.drawArc(const Rect.fromLTWH(116, 68, 10, 8), 0, math.pi, false, eye);
    canvas.drawArc(const Rect.fromLTWH(104, 82, 12, 8), 0.2, math.pi - 0.4, false, eye);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class CliffScene extends StatelessWidget {
  const CliffScene({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _CliffPainter(),
      child: const SizedBox.expand(),
    );
  }
}

class _CliffPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRRect(
      RRect.fromRectAndRadius(Offset.zero & size, const Radius.circular(20)),
      Paint()..color = AppColors.relaxGold,
    );

    final hill = Paint()..color = const Color(0xFFD9A628);
    canvas.drawOval(Rect.fromLTWH(-20, size.height * 0.42, size.width * 0.55, size.height * 0.5), hill);
    canvas.drawOval(Rect.fromLTWH(size.width * 0.45, size.height * 0.48, size.width * 0.6, size.height * 0.45), hill);

    final water = Paint()..color = const Color(0xFFE9D48A).withValues(alpha: 0.7);
    canvas.drawOval(Rect.fromLTWH(size.width * 0.08, size.height * 0.52, 90, 28), water);
    canvas.drawOval(Rect.fromLTWH(size.width * 0.42, size.height * 0.58, 70, 22), water);

    final rock = Path()
      ..moveTo(size.width * 0.28, size.height)
      ..lineTo(size.width * 0.38, size.height * 0.62)
      ..lineTo(size.width * 0.62, size.height * 0.62)
      ..lineTo(size.width * 0.78, size.height)
      ..close();
    canvas.drawPath(rock, Paint()..color = const Color(0xFF3A3A48));

    final skin = Paint()..color = const Color(0xFFFFE0C2);
    final shirt = Paint()..color = Colors.white;
    final pants = Paint()..color = const Color(0xFF2B2B2B);
    final cx = size.width * 0.5;
    canvas.drawCircle(Offset(cx, size.height * 0.28), 16, skin);
    canvas.drawCircle(Offset(cx - 2, size.height * 0.26), 16, Paint()..color = const Color(0xFF2A2A2A));
    canvas.drawCircle(Offset(cx, size.height * 0.29), 14, skin);
    canvas.drawRRect(RRect.fromRectAndRadius(Rect.fromCenter(center: Offset(cx, size.height * 0.44), width: 36, height: 40), const Radius.circular(8)), shirt);
    canvas.drawRRect(RRect.fromRectAndRadius(Rect.fromCenter(center: Offset(cx, size.height * 0.58), width: 28, height: 28), const Radius.circular(6)), pants);
    canvas.drawCircle(Offset(cx - 22, size.height * 0.46), 7, skin);
    canvas.drawCircle(Offset(cx + 22, size.height * 0.46), 7, skin);

    // dog
    final dog = Paint()..color = const Color(0xFFEDE6D6);
    canvas.drawOval(Rect.fromCenter(center: Offset(size.width * 0.78, size.height * 0.78), width: 36, height: 18), dog);
    canvas.drawCircle(Offset(size.width * 0.88, size.height * 0.74), 8, dog);

    // reeds
    final reed = Paint()
      ..color = const Color(0xFF8A6A22)
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(Offset(28, size.height * 0.82), Offset(22, size.height * 0.58), reed);
    canvas.drawLine(Offset(36, size.height * 0.82), Offset(40, size.height * 0.55), reed);
    canvas.drawLine(Offset(size.width - 30, size.height * 0.85), Offset(size.width - 24, size.height * 0.6), reed);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class SunMoonCardArt extends StatelessWidget {
  const SunMoonCardArt({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: _SunMoonPainter(), child: const SizedBox.expand());
  }
}

class _SunMoonPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRRect(
      RRect.fromRectAndRadius(Offset.zero & size, const Radius.circular(18)),
      Paint()..color = const Color(0xFFF5C63D),
    );
    final sun = Paint()..color = const Color(0xFFFF7A3D);
    final cx = size.width * 0.42;
    final cy = size.height * 0.52;
    for (var i = 0; i < 12; i++) {
      final a = i * math.pi / 6;
      canvas.drawLine(
        Offset(cx + math.cos(a) * 38, cy + math.sin(a) * 38),
        Offset(cx + math.cos(a) * 58, cy + math.sin(a) * 58),
        Paint()
          ..color = const Color(0xFFFF7A3D)
          ..strokeWidth = 6
          ..strokeCap = StrokeCap.round,
      );
    }
    canvas.drawCircle(Offset(cx, cy), 40, sun);
    canvas.drawArc(Rect.fromCircle(center: Offset(cx - 10, cy - 4), radius: 8), 0.2, math.pi - 0.4, false, Paint()
      ..color = const Color(0xFF5A2A12)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2);
    canvas.drawArc(Rect.fromCircle(center: Offset(cx + 12, cy - 4), radius: 8), 0.2, math.pi - 0.4, false, Paint()
      ..color = const Color(0xFF5A2A12)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2);

    final moon = Paint()..color = const Color(0xFF5C6B7A);
    canvas.drawCircle(Offset(size.width * 0.68, size.height * 0.46), 34, moon);
    canvas.drawCircle(Offset(size.width * 0.74, size.height * 0.42), 28, Paint()..color = const Color(0xFFF5C63D));
    canvas.drawCircle(Offset(size.width * 0.22, size.height * 0.22), 10, Paint()..color = Colors.white70);
    canvas.drawCircle(Offset(size.width * 0.8, size.height * 0.78), 8, Paint()..color = Colors.white70);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class SleepHourArt extends StatelessWidget {
  const SleepHourArt({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: _SkyPainter(const Color(0xFFF3A02A), stars: true), child: const SizedBox.expand());
  }
}

class EasyMissionArt extends StatelessWidget {
  const EasyMissionArt({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: _SkyPainter(const Color(0xFFE8C23A), moon: true), child: const SizedBox.expand());
  }
}

class RelaxWithMeArt extends StatelessWidget {
  const RelaxWithMeArt({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: _SkyPainter(const Color(0xFF4C8DFF)), child: const SizedBox.expand());
  }
}

class SunEnergyArt extends StatelessWidget {
  const SunEnergyArt({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: _SkyPainter(const Color(0xFF1FAF9A), suns: true), child: const SizedBox.expand());
  }
}

class _SkyPainter extends CustomPainter {
  _SkyPainter(this.bg, {this.stars = false, this.moon = false, this.suns = false});
  final Color bg;
  final bool stars;
  final bool moon;
  final bool suns;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRRect(
      RRect.fromRectAndRadius(Offset.zero & size, const Radius.circular(16)),
      Paint()..color = bg,
    );
    final white = Paint()..color = Colors.white.withValues(alpha: 0.9);
    canvas.drawOval(Rect.fromLTWH(size.width * 0.12, size.height * 0.18, 50, 18), white);
    canvas.drawOval(Rect.fromLTWH(size.width * 0.55, size.height * 0.28, 40, 14), white);
    if (stars) {
      final star = Paint()..color = const Color(0xFFFFE27A);
      canvas.drawCircle(Offset(size.width * 0.3, size.height * 0.55), 3, star);
      canvas.drawCircle(Offset(size.width * 0.7, size.height * 0.62), 3, star);
      canvas.drawCircle(Offset(size.width * 0.5, size.height * 0.4), 2.4, star);
    }
    if (moon) {
      canvas.drawCircle(Offset(size.width * 0.62, size.height * 0.55), 22, Paint()..color = const Color(0xFF5C6B7A));
      canvas.drawCircle(Offset(size.width * 0.7, size.height * 0.5), 18, Paint()..color = bg);
      canvas.drawOval(Rect.fromLTWH(size.width * 0.18, size.height * 0.42, 48, 20), white);
    }
    if (suns) {
      canvas.drawCircle(Offset(size.width * 0.28, size.height * 0.38), 10, Paint()..color = const Color(0xFFFFE27A));
      canvas.drawCircle(Offset(size.width * 0.72, size.height * 0.58), 8, Paint()..color = const Color(0xFFFFE27A));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class AtlantisHeaderArt extends StatelessWidget {
  const AtlantisHeaderArt({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: _AtlantisPainter(), child: const SizedBox.expand());
  }
}

class _AtlantisPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final bg = Paint()
      ..shader = const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFF8EA0FF), Color(0xFF4E63E8), Color(0xFF3B4ED0)],
      ).createShader(Offset.zero & size);
    canvas.drawRect(Offset.zero & size, bg);

    canvas.drawCircle(Offset(size.width * 0.18, size.height * 0.7), 80, Paint()..color = const Color(0xFF6B7CFF).withValues(alpha: 0.4));
    canvas.drawCircle(Offset(size.width * 0.85, size.height * 0.2), 70, Paint()..color = const Color(0xFF7A8CFF).withValues(alpha: 0.35));

    final whale = Path()
      ..moveTo(size.width * 0.08, size.height * 0.55)
      ..cubicTo(size.width * 0.25, size.height * 0.18, size.width * 0.7, size.height * 0.18, size.width * 0.78, size.height * 0.48)
      ..cubicTo(size.width * 0.8, size.height * 0.62, size.width * 0.55, size.height * 0.72, size.width * 0.22, size.height * 0.68)
      ..close();
    canvas.drawPath(whale, Paint()..color = const Color(0xFFE9E2C8));
    canvas.drawCircle(Offset(size.width * 0.7, size.height * 0.42), 6, Paint()..color = const Color(0xFF3A3328));
    final tail = Path()
      ..moveTo(size.width * 0.12, size.height * 0.42)
      ..quadraticBezierTo(size.width * 0.02, size.height * 0.18, size.width * 0.18, size.height * 0.22)
      ..quadraticBezierTo(size.width * 0.16, size.height * 0.36, size.width * 0.22, size.height * 0.4)
      ..close();
    canvas.drawPath(tail, Paint()..color = const Color(0xFFE3C75A));

    // person
    final skin = Paint()..color = const Color(0xFFFFC9A0);
    canvas.drawCircle(Offset(size.width * 0.86, size.height * 0.38), 16, skin);
    canvas.drawCircle(Offset(size.width * 0.86, size.height * 0.36), 16, Paint()..color = const Color(0xFFFF7A3D));
    canvas.drawCircle(Offset(size.width * 0.86, size.height * 0.39), 13, skin);
    canvas.drawRRect(
      RRect.fromRectAndRadius(Rect.fromCenter(center: Offset(size.width * 0.86, size.height * 0.58), width: 34, height: 44), const Radius.circular(10)),
      Paint()..color = const Color(0xFF1C1C24),
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(Rect.fromCenter(center: Offset(size.width * 0.86, size.height * 0.82), width: 28, height: 40), const Radius.circular(8)),
      Paint()..color = const Color(0xFF5A6AD8),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
