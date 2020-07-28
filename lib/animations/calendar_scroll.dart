import 'package:flutter/material.dart';

final offsetAnimation = TweenSequence([
  TweenSequenceItem(
      tween: Tween<Offset>(begin: Offset(0, 1), end: Offset(0, 0)), weight: 1),
  TweenSequenceItem(tween: ConstantTween(Offset(0, 0)), weight: 3),
  TweenSequenceItem(
      tween: Tween<Offset>(begin: Offset(0, 0), end: Offset(0, -1)), weight: 1)
]);
