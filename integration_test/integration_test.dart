import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_cucumber/main.dart';
import 'package:gherkin_integration_test/gherkin_integration_test.dart';

import 'step/launch_app.dart';

void main() {
  IntegrationTest(
    description: 'Basic integration test on default flutter project',
    features: [
      IntegrationFeature(
        description: '',
        scenarios: [
          IntegrationScenario(
            description: '',
            steps: [
              GivenLaunchApp(),
              WhenTapIncrementButtonNTimes(times: 1),
              WhenTapIncrementButtonNTimes(times: 3),
              ThenFindByText('4'),
            ],
          ),
        ],
      )
    ],
  ).test();
}
