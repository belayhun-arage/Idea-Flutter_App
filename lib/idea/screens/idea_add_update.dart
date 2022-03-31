import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_network/idea/idea.dart';

class AddUpdateIdea extends StatefulWidget {
  static const routeName = 'ideaAddUpdate';
  final IdeaArgument args;

  AddUpdateIdea({this.args});
  @override
  _AddUpdateIdeaState createState() => _AddUpdateIdeaState();
}

class _AddUpdateIdeaState extends State<AddUpdateIdea> {
  final _formKey = GlobalKey<FormState>();

  final Map<String, dynamic> _idea = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.args.edit ? "Edit Idea" : "Add New IDea"}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                  initialValue: widget.args.edit ? widget.args.idea.title : '',
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter idea title';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'Idea Title'),
                  onSaved: (value) {
                    setState(() {
                      this._idea["title"] = value;
                    });
                  }),
              TextFormField(
                  initialValue:
                      widget.args.edit ? widget.args.idea.title : '',
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter idea description';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'Idea description'),
                  onSaved: (value) {
                    this._idea["description"] = value;
                  }),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton.icon(
                  onPressed: () {
                    final form = _formKey.currentState;
                    if (form.validate()) {
                      form.save();
                      final IdeaEvent event = widget.args.edit
                          ? IdeaUpdate(
                              Idea(
                                id: widget.args.idea.id,
                                title: this._idea["title"],
                                description: this._idea["description"],
                              ),
                            )
                          : IdeaCreate(
                              Idea(
                                title: this._idea["title"],
                                description: this._idea["description"],
                              ),
                            );
                      BlocProvider.of<IdeaBloc>(context).add(event);
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          IdeasList.routeName, (route) => false);
                    }
                  },
                  label: Text('SAVE'),
                  icon: Icon(Icons.save),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
