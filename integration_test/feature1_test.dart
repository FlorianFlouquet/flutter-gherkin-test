import 'package:gherkin_integration_test/integration_test.dart';
import 'step/all_steps.dart';

class Feature1Test extends IntegrationTest {
  Feature1Test()
      : super(
          description: '',
          features: [
            IntegrationFeature(
              description: 'test feature 1',
              scenarios: [
                IntegrationScenario(
                  description: 'test scenario 1',
                  steps: [
                    LaunchApp(),
                    TapIncrementButtonNTimes(),
                    FindByText()
                  ],
                ),
              ],
            ),
          ],
        );
}

void main() {
  Feature1Test().test();
}
