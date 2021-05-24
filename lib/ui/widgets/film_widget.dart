import 'package:cinema/model/Movie.dart';
import 'package:cinema/model/ProjectionFilm.dart';
import 'package:intl/intl.dart' as intl;
import 'package:cinema/ui/widgets/cadre_widget.dart';
import 'package:flutter/material.dart';

class FilmWidget extends StatefulWidget {
  const FilmWidget({Key key, this.width, this.pro, this.movie})
      : super(key: key);
  final Movie movie;
  final ProjectionFilm pro;
  final double width;
  @override
  _FilmWidgetState createState() => _FilmWidgetState();
}

class _FilmWidgetState extends State<FilmWidget> {
  @override
  Widget build(BuildContext context) {
    return CadreWidget(
      width: widget.width / 2,
      title: (widget.pro?.seance?.salle?.name ?? ("salle 1")) +
              " : " +
              widget.movie?.titre ??
          "movie",
      kids: [
        Container(
          width: (widget.width / 2) * 0.4,
          child: FittedBox(
            fit: BoxFit.contain,
            child: Image.network(
              widget.movie?.photo ?? "",
            ),
          ),
        ),
        CadreWidget(
          width: (widget.width / 2) * 0.4,
          kids: [
            (widget.pro != null && widget.pro.seance != null)
                ? Container(
                    width: (widget.width / 2) * 0.3,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(intl.DateFormat('dd/MM/yyy hh:mm:ss')
                          .format(widget.pro.seance.heureDebut)),
                    ),
                  )
                : Container(),
          ],
        ),
      ],
    );
  }
}
