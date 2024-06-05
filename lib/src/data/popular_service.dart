// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../domains/models/previews_model.dart';

class ApiService{
  final Dio _dio = Dio();
Future<PreviewsModel?> fetchDataPopular({required int index}) async {
  try {
    Response response = await _dio.get(
        "https://api.themoviedb.org/3/movie/popular?api_key=2aff523ab63b65fe51dc5c7394eaf111&page=$index");
    return PreviewsModel.fromJson(response.data);
  } on DioException catch (e) {
      debugPrint(e.message);
    }
}
}
