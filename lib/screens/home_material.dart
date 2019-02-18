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
        body: Builder(
            builder: (context) => Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: RaisedButton(
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              // If the form is valid, we want to show a Snackbar
                              Scaffold.of(context).showSnackBar(
                                  SnackBar(content: Text('Processing Data')));
                            }
                          },
                          child: Text('Submit'),
                        ),
                      ),
                    ],
                  ),
                )));
  }
}
