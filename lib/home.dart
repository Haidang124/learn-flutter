import 'package:flutter/material.dart';
import 'web_view_container.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> _links = [];
  String logBug = 'log';
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(controller: myController),
              Container(
                  margin: const EdgeInsets.all(25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FlatButton(
                        child: const Text(
                          'Add',
                          style: TextStyle(fontSize: 20.0),
                        ),
                        color: Colors.blueAccent,
                        textColor: Colors.white,
                        onPressed: () {
                          if (myController.text != '' &&
                              RegExp(r'(?:(?:https?|ftp):\/\/)?[\w/\-?=%.]+\.[\w/\-?=%.]+')
                                  .hasMatch(myController.text)) {
                            setState(() {
                              _links.add(myController.text);
                            });
                            myController.text = '';
                          }
                        },
                      ),
                      FlatButton(
                        child: const Text(
                          'ViewLog',
                          style: TextStyle(fontSize: 20.0),
                        ),
                        color: Colors.blueAccent,
                        textColor: Colors.white,
                        onPressed: () => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('AlertDialog Title'),
                            content: Text(logBug),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'Cancel'),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        ),
                      ),
                      FlatButton(
                        child: const Text(
                          'Clear',
                          style: TextStyle(fontSize: 20.0),
                        ),
                        color: Colors.blueAccent,
                        textColor: Colors.white,
                        onPressed: () {
                          setState(() {
                            _links = [];
                          });
                        },
                      ),
                    ],
                  )),
              Column(
                children: [
                  ..._links.map((link) => _urlButton(context, link)).toList(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _urlButton(BuildContext context, String url) {
    return Container(
        padding: const EdgeInsets.all(20.0),
        child: FlatButton(
          color: Theme.of(context).primaryColor,
          padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
          child: Text(url),
          onPressed: () => _handleURLButtonPress(context, url),
        ));
  }

  void _handleURLButtonPress(BuildContext context, String url) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => WebViewContainer(url: url)));
  }
}
