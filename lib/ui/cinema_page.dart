import 'package:cinema/api/DioServie.dart';
import 'package:cinema/bloc/cinema/cinema.dart';
import 'package:cinema/model/Cinema.dart';
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bloc = CinemaBloc(RepositoryProvider.of<DioService>(context));
    _bloc..add(CinemaLoadingEvent(first: true));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CinemaBloc, CinemaState>(
      bloc: _bloc,
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(context),
          body: FutureBuilder(
            future: RepositoryProvider.of<DioService>(context).getAllVille(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Ville> villes = [];
                villes = snapshot.data;
                if (selectedVilleId == -1) selectedVilleId = villes.first.id;
                return Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: SingleChildScrollView(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CadreWidget(
                            title: "Spider Man",
                            width: 200,
                            kids: [
                              FilmWidget(),
                            ],
                          ),
                          Column(
                            children: [
                              for (Ville vil in villes)
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.15 <
                                              150
                                          ? 150
                                          : MediaQuery.of(context).size.width *
                                              0.15,
                                  child: MaterialButton(
                                    color: vil.id == selectedVilleId
                                        ? Theme.of(context).accentColor
                                        : Theme.of(context).primaryColor,
                                    onPressed: selectedVilleId == vil.id
                                        ? () {}
                                        : () {
                                            selectedVilleId = vil.id;
                                            _bloc.add(
                                                CinemaLoadingEvent(ville: vil));
                                          },
                                    child: Text(vil.name),
                                  ),
                                )
                            ],
                          ),
                          //cinema
                          (state.cinemas == null || state.cinemas.length == 0)
                              ? Container()
                              : Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      20, 0, 10, 10.0),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    child: Table(
                                      border: TableBorder.all(
                                          width: 2,
                                          color: Theme.of(context).hintColor),
                                      children: [
                                        for (Cinema cin in state.cinemas)
                                          TableRow(
                                              decoration: BoxDecoration(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                              ),
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(cin.name),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                      cin.latitude.toString()),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                      cin.longitude.toString()),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(cin.nombreSalles
                                                      .toString()),
                                                )
                                              ])
                                      ],
                                    ),
                                  ),
                                ),
                        ],
                      ),
                    ));
              } else
                return Center(
                    child: CircularProgressIndicator(
                  backgroundColor: Colors.yellow[600],
                ));
            },
          ),
        );
      },
    );
  }
}
