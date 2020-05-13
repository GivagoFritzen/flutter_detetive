import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterdetetive/utils/colorsUtil.dart';

void main() {
  test('Get Dark Green', () {
    Color color = ColorsUtil.getDarkGreen();

    expect(color, Color(0xff10201A));
  });

  test('Get Medium Green', () {
    Color color = ColorsUtil.getMediumGreen();

    expect(color, Color(0xff2A5045));
  });

  test('Get Light Green', () {
    Color color = ColorsUtil.getLightGreen();

    expect(color, Color(0xff376C5A));
  });
}
