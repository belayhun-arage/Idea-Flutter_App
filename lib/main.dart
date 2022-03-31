import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_network/bloc_observer.dart';
import 'package:flutter_network/idea/idea.dart';
import 'package:http/http.dart' as http;

void main() {
  Bloc.observer = SimpleBlocObserver();

  final IdeaRepository ideaRepository = IdeaRepository(
    dataProvider: IdeaDataProvider(
      httpClient: http.Client(),
    ),
  );

  runApp(
    IdeaApp(ideaRepository: ideaRepository),
  );
}

class IdeaApp extends StatelessWidget {
  final IdeaRepository ideaRepository;

  IdeaApp({@required this.ideaRepository})
      : assert(ideaRepository != null);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: this.ideaRepository,
      child: BlocProvider(
        create: (context) => IdeaBloc(ideaRepository: this.ideaRepository)
          ..add(IdeaLoad()),
        child: MaterialApp(
          title: 'Course App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          onGenerateRoute: IdeaAppRoute.generateRoute,
        ),
      ),
    );
  }
}
