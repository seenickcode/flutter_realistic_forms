import 'package:flutter/material.dart';

class HomeMaterial extends StatefulWidget {
  @override
  _HomeMaterialState createState() => _HomeMaterialState();
}

class _HomeMaterialState extends State<HomeMaterial> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Form Demo')),
        body: Container(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: Builder(
                builder: (context) => Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TextFormField(
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter some text';
                              }
                            },
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 16.0),
                            child: RaisedButton(
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  _showDialog(context);
                                }
                              },
                              child: Text('Submit'),
                            ),
                          ),
                        ],
                      ),
                    ))));
  }

  _showDialog(BuildContext context) {
    Scaffold.of(context)
        .showSnackBar(SnackBar(content: Text('Submitting form')));
  }
}
