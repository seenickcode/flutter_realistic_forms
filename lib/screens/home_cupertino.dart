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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CupertinoTextField(
                placeholder: 'Enter some text',
                // NOTE not common to show error message adjacent to form fields in iOS, so
                // this is not available
                // validator: (value) {
                //   if (value.isEmpty) {
                //     return 'Please enter some text';
                //   }
                // },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: CupertinoButton(
                  onPressed: () {
                    // Validate will return true if the form is valid, or false if
                    // the form is invalid.
                    if (_formKey.currentState.validate()) {
                      // If the form is valid, we want to show a Snackbar
                      showCupertinoDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              CupertinoAlertDialog(
                                title: const Text('Hello'),
                                content: const Text('This is a message.'),
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
                  },
                  child: Text('Submit'),
                ),
              ),
            ],
          ),
        )));
  }
}
