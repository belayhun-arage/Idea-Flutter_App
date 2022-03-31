import 'package:equatable/equatable.dart';
import 'package:flutter_network/idea/idea.dart';

class IdeaState extends Equatable {
  const IdeaState();

  @override
  List<Object> get props => [];
}

class IdeaLoading extends IdeaState {}

class IdeasLoadSuccess extends IdeaState {
  final List<Idea> ideas;

  IdeasLoadSuccess([this.ideas = const []]);

  @override
  List<Object> get props => [ideas];
}

class IdeaOperationFailure extends IdeaState {}
