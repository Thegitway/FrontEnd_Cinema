import 'dart:convert';

import 'package:cinema/model/Cinema.dart';
import 'package:cinema/model/Ville.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:logger/logger.dart';

import 'DioInterceptor.dart';

class DioService {
  Dio dio;
  Logger logger = Logger(
    printer: PrettyPrinter(
      printTime: false,
      methodCount: 0,
      colors: true,
      printEmojis: true,
    ),
  );

  Future<Dio> getClient() async {
    final dioInterceptors = DioInterceptors();
    return dioInterceptors.addInterceptors(dio);
  }

  Future<List<Cinema>> getAllCinema() async {
    try {
      dio = Dio();
      var response = await dio.get(
        "http://localhost:8080/cinema",
      );
      if (response.statusCode == 200) {
        List<Cinema> cinema = [];
        for (var data in response.data) cinema.add(Cinema.fromJson(data));
        return cinema;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<List<Cinema>> getCinemaVille(Ville ville) async {
    try {
      dio = Dio();
      var response = await dio.post(
        "http://localhost:8080/cinemaVille/${ville.id}",
      );
      if (response.statusCode == 200) {
        List<Cinema> cinema = [];
        for (var data in response.data) cinema.add(Cinema.fromJson(data));
        return cinema;
      } else
        return null;
    } catch (e) {
      print(e);
    }
  }

  Future<Ville> getFirstVille() async {
    try {
      dio = Dio();
      var response = await dio.get(
        "http://localhost:8080/villeFirst",
      );
      if (response.statusCode == 200) {
        Ville ville;
        ville = Ville.fromJson(response.data);
        print("omar " + ville.name + ville.id.toString());
        return ville;
      } else
        return null;
    } catch (e) {
      print(e);
    }
  }

  Future<List<Ville>> getAllVille() async {
    try {
      dio = Dio();
      var response = await dio.get(
        "http://localhost:8080/ville",
      );
      if (response.statusCode == 200) {
        List<Ville> ville = [];
        for (var data in response.data) ville.add(Ville.fromJson(data));
        return ville;
      } else
        return null;
    } catch (e) {
      print(e);
    }
  }
}
