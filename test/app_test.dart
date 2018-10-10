@TestOn('browser')

import 'package:angular_test/angular_test.dart';
import 'package:dart_test/app_component.dart';
import 'package:dart_test/app_component.template.dart' as ng;
import 'package:test/test.dart';

void main() {
  final testBed = NgTestBed.forComponent<AppComponent>(ng.AppComponentNgFactory);
  NgTestFixture<AppComponent> fixture;

  setUp(() async {
    fixture = await testBed.create();
  });

  tearDown(disposeAnyRunningTest);

  test('Text', () {
    expect(fixture.text, 'Сколько вы хотите снять? Ваши деньги:');
  });
  // ···
}