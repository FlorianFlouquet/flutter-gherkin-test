import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_cucumber/main.dart';
import 'package:gherkin_integration_test/gherkin_integration_test.dart';

class LaunchApp extends Given<IntegrationExample> {
  LaunchApp()
      : super('Launch app', (tester, log, box, mocks,
            [example, binding]) async {
          await tester.pumpWidget(const MyApp());
          await tester.pumpAndSettle();
        });
}

class TapIncrementButtonNTimes extends When<IntegrationExample> {
  TapIncrementButtonNTimes()
      : super('', (tester, log, box, mocks, [example, binding]) async {
          final incrementButton = find.byKey(const Key('increment_button'));
          await tester.tap(incrementButton);
          await tester.pumpAndSettle();
        });
}

class FindByText extends Then<IntegrationExample> {
  FindByText()
      : super('Find text 1', (tester, log, box, mocks,
            [example, binding]) async {
          expect(find.text('1'), findsOneWidget);
        });
}
