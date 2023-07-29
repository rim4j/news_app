import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class ThemeStatus extends Equatable {}

@immutable
class DarkMode extends ThemeStatus {
  DarkMode({
    required this.isDarkMode,
  });
  final bool isDarkMode;

  @override
  List<Object?> get props => [isDarkMode];
}
