import 'package:flutter/cupertino.dart';

class HomeCupertino extends StatefulWidget {
  @override
  _HomeCupertinoState createState() => _HomeCupertinoState();
}

class _HomeCupertinoState extends State<HomeCupertino> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(middle: Text('Form Demo')),
        child:
            // NOTE by default, iOS uses 'extended layout' and therefore content can appear
            // underneath the navigation bar. typically iOS controls such as UIScrollView
            // and UITableView take the navigation bar into consideration to prevent this, but
            // in Flutter, a SafeArea widget is required.
            SafeArea(
                child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CupertinoTextField(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 16.0),
                placeholder: 'Enter some text',
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 16.0),
                child: CupertinoButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _showDialog();
                    }
                  },
                  child: Text('Submit'),
                ),
              ),
            ],
          ),
        )));
  }

  _showDialog() {
    showCupertinoDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
              title: const Text('Hello'),
              content: const Text('Submitting form'),
              actions: [
                CupertinoDialogAction(
                  child: const Text('Dismiss'),
                  onPressed: () {
                    Navigator.pop(context, 'Dismiss');
                  },
                )
              ],
            ));
  }
}
