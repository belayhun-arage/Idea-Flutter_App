import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_network/idea/idea.dart';

class IdeaDetail extends StatelessWidget {
  static const routeName = 'ideaDetail';
  final Idea idea;

  IdeaDetail({@required this.idea});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${this.idea.title}'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () => Navigator.of(context).pushNamed(
              AddUpdateIdea.routeName,
              arguments: IdeaArgument(idea: this.idea, edit: true),
            ),
          ),
          SizedBox(
            width: 32,
          ),
          IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                context.read<IdeaBloc>().add(IdeaDelete(this.idea));
                Navigator.of(context).pushNamedAndRemoveUntil(
                    IdeasList.routeName, (route) => false);
              }),
        ],
      ),
      body: Card(
        child: Column(
          children: [
            ListTile(
              title: Text('Title: ${this.idea.title}'),
              subtitle: Text('Description: ${this.idea.description}'),
            ),
            Text(
              'Details',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(this.idea.description),
          ],
        ),
      ),
    );
  }
}
