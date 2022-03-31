import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_network/idea/bloc/bloc.dart';
import 'package:flutter_network/idea/idea.dart';

class IdeaBloc extends Bloc<IdeaEvent, IdeaState> {
  final IdeaRepository ideaRepository;

  IdeaBloc({@required this.ideaRepository})
      : assert(ideaRepository != null),
        super(IdeaLoading());

  @override
  Stream<IdeaState> mapEventToState(IdeaEvent event) async* {
    if (event is IdeaLoad) {
      yield IdeaLoading();
      try {
        final ideas = await ideaRepository.getIdeas();
        yield IdeasLoadSuccess(ideas);
      } catch (_) {
        yield IdeaOperationFailure();
      }
    }

    if (event is IdeaCreate) {
      try {
        await ideaRepository.createIdea(event.idea);
        final ideas = await ideaRepository.getIdeas();
        yield IdeasLoadSuccess(ideas);
      } catch (_) {
        yield IdeaOperationFailure();
      }
    }

    if (event is IdeaUpdate) {
      try {
        await ideaRepository.updateIdea(event.idea);
        final ideas = await ideaRepository.getIdeas();
        yield IdeasLoadSuccess(ideas);
      } catch (_) {
        yield IdeaOperationFailure();
      }
    }

    if (event is IdeaDelete) {
      try {
        await ideaRepository.deleteIdea(event.idea.id);
        final ideas = await ideaRepository.getIdeas();
        yield IdeasLoadSuccess(ideas);
      } catch (_) {
        yield IdeaOperationFailure();
      }
    }
  }
}
