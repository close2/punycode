// Copyright (c) 2017, cl. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:punycode/punycode.dart';

void main() {
  const unicode = 'Bücher';
  var encoded = punycodeEncode(unicode);
  print('$unicode encoded is $encoded');
}
