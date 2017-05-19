// Copyright (c) 2017, cl. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:punycode/punycode.dart';
import 'package:test/test.dart';

class StringPunyCode {
  final String description;
  final String original;
  final String punyCode;

  const StringPunyCode(this.description, this.original, this.punyCode);
}

const List<StringPunyCode> examples = const <StringPunyCode>[
  const StringPunyCode(
      'RFC example A: Arabic',
      '\u0644\u064A\u0647\u0645\u0627\u0628\u062A\u0643\u0644\u0645\u0648\u0634\u0639\u0631\u0628\u064A\u061F',
      'egbpdaj6bu4bxfgehfvwxn'),
  const StringPunyCode(
      'RFC example B: Chinese (simplified)',
      '\u4ED6\u4EEC\u4E3A\u4EC0\u4E48\u4E0D\u8BF4\u4E2D\u6587',
      'ihqwcrb4cv8a8dqg056pqjye'),
  const StringPunyCode(
      'RFC example C: Chinese (traditional)',
      '\u4ED6\u5011\u7232\u4EC0\u9EBD\u4E0D\u8AAA\u4E2D\u6587',
      'ihqwctvzc91f659drss3x8bo0yb'),
  const StringPunyCode(
      'RFC example D: Czech',
      '\u0050\u0072\u006F\u010D\u0070\u0072\u006F\u0073\u0074\u011B\u006E\u0065\u006D\u006C\u0075\u0076\u00ED\u010D\u0065\u0073\u006B\u0079',
      'Proprostnemluvesky-uyb24dma41a')
];

void main() {
  group('RFC punycode ENCODE example tests', () {
    examples.forEach((StringPunyCode ex) {
      test(ex.description,
          () => expect(punycodeEncode(ex.original), ex.punyCode));
    });
    /*test('bücher → xn--bcher-kva', () {
      //expect(punycodeEncode('bücher'), 'xn--bcher-kva');
      expect(punycodeEncode('bücher'), 'bcher-kva');
    });*/
  });
  group('RFC punycode DECODE example tests', () {
    examples.forEach((StringPunyCode ex) {
      test(ex.description,
              () => expect(punycodeDecode(ex.punyCode), ex.original));
    });
    /*test('bücher → xn--bcher-kva', () {
      //expect(punycodeEncode('bücher'), 'xn--bcher-kva');
      expect(punycodeEncode('bücher'), 'bcher-kva');
    });*/
  });
}
