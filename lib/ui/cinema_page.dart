import 'package:cinema/api/DioServie.dart';
import 'package:cinema/bloc/cinema/cinema.dart';
import 'package:cinema/model/Cinema.dart';
import 'package:cinema/model/ProjectionFilm.dart';
import 'package:cinema/model/Ville.dart';
import 'package:cinema/ui/widgets/cadre_widget.dart';
import 'package:cinema/ui/widgets/film_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cinema/ui/widgets/CustomAppBar.dart';

class CinemaPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CinemaPageState();
}

class _CinemaPageState extends State<CinemaPage> {
  CinemaBloc _bloc;
  int selectedVilleId = -1;
  int selectedCinId = -1;
  List<Cinema> cinemas = [];
  List<ProjectionFilm> pros = [];
  List<Ville> villes = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bloc = CinemaBloc(RepositoryProvider.of<DioService>(context));
    _bloc..add(CinemaVilleLoadingEvent(first: true));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context),
      body: BlocConsumer<CinemaBloc, CinemaState>(
        bloc: _bloc,
        listener: (context, state) {
          if (state.currentState == CinemaCurrentState.Cinemaloaded) {
            if (state.cinemas != null) cinemas = state.cinemas;
            if (state.villes != null) villes = state.villes;
          } else if (state.currentState ==
              CinemaCurrentState.Projectionloaded) {
            if (state.pros != null) pros = state.pros;
          }
        },
        builder: (context, state) {
          if (state.currentState == CinemaCurrentState.error) {
            return AlertDialog(
              title: Text("Sorry"),
              content: Text(state.error),
              actions: [
                MaterialButton(
                    child: Text("ok"),
                    onPressed: () {
                      selectedVilleId = -1;
                      selectedCinId = -1;
                      _bloc.add(CinemaVilleLoadingEvent(first: true));
                    })
              ],
            );
          } else if (state.currentState == CinemaCurrentState.Cinemaloaded ||
              state.currentState == CinemaCurrentState.Projectionloaded) {
            if (selectedVilleId == -1) selectedVilleId = villes.first.id;
            return Padding(
                padding: const EdgeInsets.all(18.0),
                child: SingleChildScrollView(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          for (Ville vil in villes)
                            Container(
                              width: MediaQuery.of(context).size.width * 0.15,
                              child: MaterialButton(
                                color: vil.id == selectedVilleId
                                    ? Theme.of(context).accentColor
                                    : Theme.of(context).primaryColor,
                                onPressed: selectedVilleId == vil.id
                                    ? () {}
                                    : () {
                                        selectedVilleId = vil.id;
                                        _bloc.add(CinemaVilleLoadingEvent(
                                            ville: vil));
                                      },
                                child: FittedBox(
                                    fit: BoxFit.contain, child: Text(vil.name)),
                              ),
                            )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.05),
                        child: CadreWidget(
                            actions: [
                              for (Cinema cin in cinemas)
                                MaterialButton(
                                  color: cin.id == selectedCinId
                                      ? Theme.of(context).accentColor
                                      : Theme.of(context).primaryColor,
                                  onPressed: selectedCinId == cin.id
                                      ? () {}
                                      : () {
                                          setState(() {
                                            selectedCinId = cin.id;
                                          });
                                          _bloc.add(
                                              CinemaClickEvent(cinema: cin));
                                        },
                                  child: Text(cin.name),
                                ),
                            ],
                            title: "Liste des Cinéma",
                            width: MediaQuery.of(context).size.width * 0.7,
                            kids: [
                              for (ProjectionFilm pro in pros)
                                FilmWidget(
                                  pro: pro,
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  movie: pro.movie,
                                ),
                            ]),
                      ),
                      //cinema
                    ],
                  ),
                ));
          } else {
            return Center(
                child: CircularProgressIndicator(
              backgroundColor: Colors.yellow[600],
            ));
          }
        },
      ),
    );
  }
}
