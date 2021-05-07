import 'package:cinema/api/DioServie.dart';
import 'package:cinema/main.dart';
import 'package:cinema/model/Cinema.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CinemaPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CinemaPageState();
}

class _CinemaPageState extends State<CinemaPage> {
  @override
  Widget build(BuildContext context) {
    //TODO translation
    return Scaffold(
      appBar: AppBar(
        title: Text("Cinemas"),
      ),
      body: FutureBuilder(
        future: RepositoryProvider.of<DioService>(context).getAllCinema(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Cinema> cinemas = [];
            cinemas = snapshot.data;

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Table(
                border: TableBorder.all(
                    width: 2, color: Theme.of(context).hintColor),
                children: [
                  for (Cinema cin in cinemas)
                    TableRow(
                        decoration: BoxDecoration(color: Colors.grey[200]),
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(cin.name),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(cin.latitude.toString()),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(cin.longitude.toString()),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(cin.nombreSalles.toString()),
                          )
                        ])
                ],
              ),
            );
          } else
            return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
