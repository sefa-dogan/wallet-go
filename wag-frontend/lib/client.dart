import 'package:dio/dio.dart';
import 'package:flutter_boilerplate/core/constants/app_strings.dart';

final dioClient = Dio(
  BaseOptions(
    baseUrl: AppStrings.BASE_URL,
  ),
);
