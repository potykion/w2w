import 'package:flutter_test/flutter_test.dart';
import 'package:w2w/core/utils.dart';

main() {
  test("Конвертация abgr в argb", () {
    expect(abgr2argb("AABBGGRR"), "AARRGGBB");
  });
}
