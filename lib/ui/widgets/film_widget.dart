import 'package:cinema/model/Movie.dart';
import 'package:cinema/ui/widgets/cadre_widget.dart';
import 'package:flutter/material.dart';

class FilmWidget extends StatefulWidget {
  const FilmWidget({Key key, this.movie}) : super(key: key);
  final Movie movie;
  @override
  _FilmWidgetState createState() => _FilmWidgetState();
}

class _FilmWidgetState extends State<FilmWidget> {
  @override
  Widget build(BuildContext context) {
    return CadreWidget(
      title: widget.movie?.titre ?? "movie",
      kids: [
        Image.network(widget.movie?.photo ?? ""),
      ],
    );
  }
}
