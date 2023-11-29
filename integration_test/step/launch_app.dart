import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_cucumber/main.dart';
import 'package:gherkin_integration_test/gherkin_integration_test.dart';

class LaunchApp extends IntegrationExample {
  LaunchApp() : super();

  List<IntegrationStep> get steps => [
        Given(
          'Launch app',
          (tester, log, box, mocks, [example, binding]) async {
            await tester.pumpWidget(const MyApp());
            await tester.pumpAndSettle();
          },
        ),
      ];
}

class GivenLaunchApp extends Given<IntegrationExample> {
  GivenLaunchApp()
      : super('Launch app', (tester, log, box, mocks,
            [example, binding]) async {
          await tester.pumpWidget(const MyApp());
          await tester.pumpAndSettle();
        });
}

class WhenTapIncrementButtonNTimes extends When<IntegrationExample> {
  WhenTapIncrementButtonNTimes({required int times})
      : super('', (tester, log, box, mocks, [example, binding]) async {
          final incrementButton = find.byKey(const Key('increment_button'));
          for (var i = 0; i < times; i++) {
            await tester.tap(incrementButton);
          }
          await tester.pumpAndSettle();
        });
}

class ThenFindByText extends Then<IntegrationExample> {
  ThenFindByText(String text)
      : super('Find text $text', (tester, log, box, mocks,
            [example, binding]) async {
          expect(find.text(text), findsOneWidget);
        });
}
