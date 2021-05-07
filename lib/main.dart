import 'package:cinema/ui/cinema_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'api/DioServie.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final DioService _dioService = DioService();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<DioService>(create: (context) => _dioService),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Color(0xFF3CB4AF),
          //green darker
          accentColor: Color(0xFF7ecec6),
          //grey dark
          hintColor: Color(0xFF838383),
          //green light
          buttonColor: Color(0xFF383838),
          //grey dark
          disabledColor: Color(0xFF666666),
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: MaterialColor(
              0xFF3CB4AF,
              <int, Color>{
                50: Color(0xFF3CB4AF),
                100: Color(0xFF3CB4AF),
                200: Color(0xFF3CB4AF),
                300: Color(0xFF3CB4AF),
                400: Color(0xFF3CB4AF),
                500: Color(0xFF3CB4AF),
                600: Color(0xFF3CB4AF),
                700: Color(0xFF3CB4AF),
                800: Color(0xFF3CB4AF),
                900: Color(0xFF3CB4AF),
              },
            ),
          ),
          //grey light
          backgroundColor: Colors.grey,
        ),
        home: CinemaPage(),
      ),
    );
  }
}
