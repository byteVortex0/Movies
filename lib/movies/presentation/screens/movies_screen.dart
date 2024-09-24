import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/movies/presentation/controller/movies_bloc.dart';
import 'package:movies/movies/presentation/controller/movies_event.dart';

import '../../../core/services/sevices_locater.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MoviesBloc(sl())
        ..add(
          GetNowPlaying(),
        ),
      child: BlocBuilder(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: null,
          );
        },
      ),
    );
  }
}
