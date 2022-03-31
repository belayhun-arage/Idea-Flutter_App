import 'package:flutter/material.dart';
import 'package:flutter_network/idea/idea.dart';

class IdeaAppRoute {
  static Route generateRoute(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(builder: (context) => IdeasList());
    }

    if (settings.name == AddUpdateIdea.routeName) {
      IdeaArgument args = settings.arguments;
      return MaterialPageRoute(
          builder: (context) => AddUpdateIdea(
                args: args,
              ));
    }

    if (settings.name == IdeaDetail.routeName) {
      Idea idea = settings.arguments;
      return MaterialPageRoute(
          builder: (context) => IdeaDetail(
                idea: idea,
              ));
    }

    return MaterialPageRoute(builder: (context) => IdeasList());
  }
}

class IdeaArgument {
  final Idea idea;
  final bool edit;
  IdeaArgument({this.idea, this.edit});
}
