import 'package:equatable/equatable.dart';
import 'package:flutter_network/idea/idea.dart';

abstract class IdeaEvent extends Equatable {
  const IdeaEvent();
}

class IdeaLoad extends IdeaEvent {
  const IdeaLoad();

  @override
  List<Object> get props => [];
}

class IdeaCreate extends IdeaEvent {
  final Idea idea;

  const IdeaCreate(this.idea);

  @override
  List<Object> get props => [idea];

  @override
  String toString() => 'Idea Created {idea: $idea}';
}

class IdeaUpdate extends IdeaEvent {
  final Idea idea;

  const IdeaUpdate(this.idea);

  @override
  List<Object> get props => [idea];

  @override
  String toString() => 'Idea Updated {idea: $idea}';
}

class IdeaDelete extends IdeaEvent {
  final Idea idea;

  const IdeaDelete(this.idea);

  @override
  List<Object> get props => [idea];

  @override
  toString() => 'Idea Deleted {idea: $idea}';
}
