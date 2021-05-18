import 'package:flutter/material.dart';

class CustomAppBar extends AppBar {
  BuildContext context;
  CustomAppBar(this.context, {Key key})
      : super(
          title: Row(
            children: [
              Text(
                "Cinema Hub",
                style: TextStyle(
                    color: Colors.grey[850], fontSize: 20, fontFamily: "KoHo"),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: MaterialButton(
                  height: 200,
                  color: Theme.of(context).accentColor,
                  child: Text(
                    "Home",
                    style: TextStyle(
                        color: Colors.black, fontSize: 16, fontFamily: "KoHo"),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        );
}
