import 'dart:convert';

import 'package:cinema/model/Cinema.dart';
import 'package:cinema/model/Movie.dart';
import 'package:cinema/model/ProjectionFilm.dart';
import 'package:cinema/model/Salle.dart';
import 'package:cinema/model/Seance.dart';
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

  Future<List<ProjectionFilm>> getProSeance(int seanceId) async {
    try {
      dio = Dio();
      var response = await dio.get(
        "http://localhost:8080/projectionFilmSeance/$seanceId",
      );
      if (response.statusCode == 200) {
        List<ProjectionFilm> pro = [];
        for (var data in response.data) pro.add(ProjectionFilm.fromJson(data));
        return pro;
      }
    } on DioError catch (e) {
      rethrow;
    }
  }

  Future<List<Seance>> getSeanceSalle(int salleId) async {
    try {
      dio = Dio();
      var response = await dio.get(
        "http://localhost:8080/projectionFilmSeance/$salleId",
      );
      if (response.statusCode == 200) {
        List<Seance> seance = [];
        for (var data in response.data) seance.add(Seance.fromJson(data));
        return seance;
      }
    } on DioError catch (e) {
      rethrow;
    }
  }

  Future<List<Salle>> getSalleCinema(int cinemaId) async {
    try {
      dio = Dio();
      var response = await dio.get(
        "http://localhost:8080/salleCinema/$cinemaId",
      );
      if (response.statusCode == 200) {
        List<Salle> salle = [];
        for (var data in response.data) salle.add(Salle.fromJson(data));
        return salle;
      }
    } on DioError catch (e) {
      rethrow;
    }
  }

  Future<List<Seance>> getAllSeance() async {
    try {
      dio = Dio();
      var response = await dio.get(
        "http://localhost:8080/seance",
      );
      if (response.statusCode == 200) {
        List<Seance> seance = [];
        for (var data in response.data) seance.add(Seance.fromJson(data));
        return seance;
      }
    } on DioError catch (e) {
      rethrow;
    }
  }

  Future<List<Movie>> getAllmovie() async {
    try {
      dio = Dio();
      var response = await dio.get(
        "http://localhost:8080/film",
      );
      if (response.statusCode == 200) {
        List<Movie> movie = [];
        for (var data in response.data) movie.add(Movie.fromJson(data));
        return movie;
      }
    } on DioError catch (e) {
      rethrow;
    }
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
    } on DioError catch (e) {
      rethrow;
    }
  }

  Future<List<Cinema>> getCinemaVille(Ville ville) async {
    try {
      dio = Dio();
      var response = await dio.get(
        "http://localhost:8080/cinemaVille/${ville.id}",
      );
      if (response.statusCode == 200) {
        List<Cinema> cinema = [];
        for (var data in response.data) cinema.add(Cinema.fromJson(data));
        return cinema;
      } else
        return null;
    } on DioError catch (e) {
      rethrow;
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
