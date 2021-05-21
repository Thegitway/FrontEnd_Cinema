import 'package:cinema/api/DioServie.dart';
import 'package:cinema/model/Cinema.dart';
import 'package:cinema/model/Ville.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cinema/ui/widgets/CustomAppBar.dart';

class CinemaPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CinemaPageState();
}

class _CinemaPageState extends State<CinemaPage> {
  @override
  Widget build(BuildContext context) {
    //TODO translation
    return Scaffold(
      appBar: CustomAppBar(context),
      body: FutureBuilder(
        future: RepositoryProvider.of<DioService>(context).getAllVille(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Ville> villes = [];
            villes = snapshot.data;
            return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      for (Ville vil in villes)
                        Container(
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: MaterialButton(
                            color: Theme.of(context).primaryColor,
                            onPressed: () {},
                            child: Text(vil.name),
                          ),
                        )
                    ],
                  ),
                ))

                //cinema
                /* Table(
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
              ),*/
                );
          } else
            return Center(
                child: CircularProgressIndicator(
              backgroundColor: Colors.yellow[600],
            ));
        },
      ),
    );
  }
}
