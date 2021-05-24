import 'package:flutter/material.dart';

@immutable
class CadreWidget extends StatefulWidget {
  const CadreWidget({Key key, this.actions, this.title, this.width, this.kids})
      : super(key: key);

  final String title;
  final List<Widget> kids;
  final double width;
  final List<Widget> actions;
  @override
  _CadreWidgetState createState() => _CadreWidgetState();
}

class _CadreWidgetState extends State<CadreWidget> {
  int i = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          border: Border.all(width: 1, color: Colors.grey)),
      child: Column(
        children: [
          //title
          Container(
            width: widget.width,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.title ?? "Cinema"),
            ),
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                border:
                    Border(bottom: BorderSide(width: 1, color: Colors.grey))),
          ),
          //leading

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: widget.actions ?? [Container()],
              ),
            ),
          ),
          for (Widget kid in doubleItem(widget.kids))
            Column(
              children: [
                kid,
              ],
            )
        ],
      ),
    );
  }

  List<Widget> doubleItem(List<Widget> widgets) {
    List<Widget> kids = [];
    for (int i = 0; i < widgets.length - 1; i += 2) {
      kids.add(Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [widgets[i], widgets[i + 1]],
      ));
    }
    if (widgets.length % 2 != 0) kids.add(widgets[widgets.length - 1]);
    return kids;
  }
}
