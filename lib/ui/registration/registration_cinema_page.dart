import 'package:cinema/api/DioServie.dart';
import 'package:cinema/ui/widgets/CustomAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cinema/bloc/cinema/cinema.dart';
import 'package:package_info/package_info.dart';

class CinemaPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CinemaPageState();
}

class _CinemaPageState extends State<CinemaPage> {
  CinemaBloc _bloc;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _latController = TextEditingController();
  final TextEditingController _longController = TextEditingController();
  final TextEditingController _placeController = TextEditingController();
  final TextEditingController _elevationController = TextEditingController();

  @override
  void initState() {
    _bloc = CinemaBloc(RepositoryProvider.of<DioService>(context));
    super.initState();
  }

  @override
  void dispose() {
    _bloc?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    BlocConsumer<CinemaBloc, CinemaState>(
      bloc: _bloc,
      listener: (context, state) {
        if (state.currentState == CinemaCurrentState.Cinemaloaded) {
        } else if (state.currentState == CinemaCurrentState.error) {}
      },
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(context),
          body: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  //name
                  TextFormField(
                    controller: _nameController,
                  ),
                  //lattitude

                  //longitude
                  TextFormField(
                    controller: _longController,
                  ),
                  //elevation
                  TextFormField(controller: _elevationController),
                  //number of seats
                  TextFormField(
                    controller: _placeController,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
