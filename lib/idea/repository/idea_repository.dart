import 'package:meta/meta.dart';
import 'package:flutter_network/idea/idea.dart';

class IdeaRepository {
  final IdeaDataProvider dataProvider;

  IdeaRepository({@required this.dataProvider})
      : assert(dataProvider != null);

  Future<Idea> createIdea(Idea course) async {
    return await dataProvider.createIdea(course);
  }

  Future<List<Idea>> getIdeas() async {
    return await dataProvider.getIdeas();
  }

  Future<void> updateIdea(Idea course) async {
    await dataProvider.updateIdea(course);
  }

  Future<void> deleteIdea(String id) async {
    await dataProvider.deleteIdea(id);
  }
}
