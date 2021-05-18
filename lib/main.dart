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
          primaryColor: Colors.yellow[400],
          //green darker
          accentColor: Colors.yellow[100],
          fontFamily: 'HoKo',
          //grey dark
          hintColor: Color(0xFF838383),
          //green light
          buttonColor: Color(0xFF383838),
          //grey dark
          disabledColor: Color(0xFF666666),
          //grey light
          backgroundColor: Colors.grey,
        ),
        debugShowCheckedModeBanner: false,
        home: CinemaPage(),
      ),
    );
  }
}
