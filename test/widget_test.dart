import 'package:flutter_test/flutter_test.dart';
import 'package:pr1_makety/main.dart';

void main() {
  testWidgets('приложение открывается', (tester) async {
    await tester.pumpWidget(const Pr1App());
    expect(find.text('Практическая работа №1'), findsOneWidget);
    expect(find.text('Простые макеты'), findsOneWidget);
  });
}
