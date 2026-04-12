import 'package:flutter_test/flutter_test.dart';
import 'package:fitness/fitness_app.dart';
import 'package:fitness/core/routing/app_router.dart';

void main() {
  testWidgets('App launch test', (WidgetTester tester) async {
    await tester.pumpWidget(FitnessApp(appRouter: AppRouter()));
    expect(find.text('FITNESS'), findsOneWidget);
  });
}
