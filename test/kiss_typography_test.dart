import 'package:flutter_test/flutter_test.dart';

import 'package:kiss_typography/kiss_typography.dart';

void main() {
  test('Tests Class', () {
    const body = Body('Hello, World!');
    expect(body, isA<Body>());

    expect(H1 == HeadlineLarge, isTrue);
    expect(H2 == HeadlineMedium, isTrue);
    expect(H3 == HeadlineSmall, isTrue);
    expect(H4 == TitleLarge, isTrue);
    expect(H5 == TitleMedium, isTrue);
    expect(H6 == TitleSmall, isTrue);
    expect(Body == BodyMedium, isTrue);
  });
}
