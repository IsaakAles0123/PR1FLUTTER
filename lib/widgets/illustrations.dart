import 'dart:math' as math;
import 'package:flutter/material.dart';

class FigmaImage extends StatelessWidget {
  const FigmaImage(
    this.asset, {
    super.key,
    this.fit = BoxFit.cover,
    this.radius = 16,
    this.alignment = Alignment.center,
  });

  final String asset;
  final BoxFit fit;
  final double radius;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    final image = Image.asset(
      asset,
      fit: fit,
      alignment: alignment,
      width: double.infinity,
      height: double.infinity,
    );
    if (radius <= 0) {
      return image;
    }
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: image,
    );
  }
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
    canvas.drawArc(
      Rect.fromCircle(center: Offset(cx - 10, cy - 4), radius: 8),
      0.2,
      math.pi - 0.4,
      false,
      Paint()
        ..color = const Color(0xFF5A2A12)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2,
    );
    canvas.drawArc(
      Rect.fromCircle(center: Offset(cx + 12, cy - 4), radius: 8),
      0.2,
      math.pi - 0.4,
      false,
      Paint()
        ..color = const Color(0xFF5A2A12)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2,
    );

    canvas.drawCircle(Offset(size.width * 0.68, size.height * 0.46), 34, Paint()..color = const Color(0xFF5C6B7A));
    canvas.drawCircle(Offset(size.width * 0.74, size.height * 0.42), 28, Paint()..color = const Color(0xFFF5C63D));
    canvas.drawCircle(Offset(size.width * 0.22, size.height * 0.22), 10, Paint()..color = Colors.white70);
    canvas.drawCircle(Offset(size.width * 0.8, size.height * 0.78), 8, Paint()..color = Colors.white70);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
