import 'package:flutter/material.dart';
import 'package:taskati1/core/services/hive.dart';

extension ThemeExtension on BuildContext {
 bool get isDark => HiveHelper.getUserInfo(HiveHelper.isdark);}