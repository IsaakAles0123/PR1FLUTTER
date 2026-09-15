import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pr1_makety/screens/complex/atlantis_screen.dart';
import 'package:pr1_makety/screens/complex/meditate_screen.dart';
import 'package:pr1_makety/screens/home_screen.dart';
import 'package:pr1_makety/screens/simple/medinow_screen.dart';
import 'package:pr1_makety/screens/simple/mind_relax_screen.dart';
import 'package:pr1_makety/theme.dart';

Future<ByteData> fileBytes(String path) async {
  final bytes = await File(path).readAsBytes();
  return ByteData.view(bytes.buffer);
}

Future<void> loadFonts() async {
  final inter = FontLoader('Inter');
  for (final file in [
    'assets/fonts/Inter-Regular.ttf',
    'assets/fonts/Inter-Medium.ttf',
    'assets/fonts/Inter-SemiBold.ttf',
    'assets/fonts/Inter-Bold.ttf',
    'assets/fonts/Inter-ExtraBold.ttf',
  ]) {
    inter.addFont(rootBundle.load(file));
  }
  await inter.load();

  final flutterRoot = Platform.environment['FLUTTER_ROOT'];
  if (flutterRoot != null) {
    final icons = FontLoader('MaterialIcons')
      ..addFont(fileBytes('$flutterRoot/bin/cache/artifacts/material_fonts/MaterialIcons-Regular.otf'));
    await icons.load();
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(loadFonts);

  Widget wrap(Widget child) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: buildAppTheme(),
      home: child,
    );
  }

  Future<void> shot(WidgetTester tester, Widget screen, String name) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    await tester.pumpWidget(wrap(screen));
    await tester.runAsync(() async {
      for (final element in find.byType(Image).evaluate()) {
        final image = element.widget as Image;
        await precacheImage(image.image, element);
      }
    });
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));
    await expectLater(find.byType(MaterialApp), matchesGoldenFile('goldens/$name.png'));
  }

  testWidgets('home', (tester) async => shot(tester, const HomeScreen(), '00_home'));
  testWidgets('medinow', (tester) async => shot(tester, const MedinowScreen(), '01_medinow'));
  testWidgets('relax', (tester) async => shot(tester, const MindRelaxScreen(), '02_mind_relax'));
  testWidgets('meditate', (tester) async => shot(tester, const MeditateScreen(), '03_meditate'));
  testWidgets('atlantis', (tester) async => shot(tester, const AtlantisScreen(), '04_atlantis'));
}
