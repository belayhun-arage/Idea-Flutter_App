import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_network/idea/bloc/bloc.dart';
import 'package:flutter_network/idea/idea.dart';

class IdeasList extends StatelessWidget {
  static const routeName = '/';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of Ideas'),
      ),
      body: BlocBuilder<IdeaBloc, IdeaState>(
        builder: (_, state) {
          if (state is IdeaOperationFailure) {
            return Text('Could not do idea operation');
          }

          if (state is IdeasLoadSuccess) {
            final ideas = state.ideas;

            return ListView.builder(
              itemCount: ideas.length,
              itemBuilder: (_, idx) => ListTile(
                title: Text('${ideas[idx].title}'),
                subtitle: Text('${ideas[idx].description}'),
                onTap: () => Navigator.of(context)
                    .pushNamed(IdeaDetail.routeName, arguments: ideas[idx]),
              ),
            );
          }

          return CircularProgressIndicator();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed(
          AddUpdateIdea.routeName,
          arguments: IdeaArgument(edit: false),
        ),
        child: Icon(Icons.add),
      ),
    );
  }
}
