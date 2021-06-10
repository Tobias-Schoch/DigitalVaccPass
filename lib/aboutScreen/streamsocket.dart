import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/appBar.dart';
import '../utils/drawer.dart';
import '../utils/util.dart';

class StreamSocket extends StatefulWidget {
  StreamSocket({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyStreamPageState createState() => _MyStreamPageState();

  final _socketResponse = StreamController<String>();

  void Function(String) get addResponse => _socketResponse.sink.add;

  Stream<String> get getResponse => _socketResponse.stream;

  void dispose() {
    _socketResponse.close();
  }
}

StreamSocket streamSocket = StreamSocket();

class _MyStreamPageState extends State<StreamSocket> {

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Change icon and action for qrcode, for better ui
        // TODO: Check from where coming & (de-) activate leading
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back),
        //   onPressed: () => Navigator.pop(context),
        // ),
        title: MyHeader(),
        elevation: 0,
      ),
      body: Container(
        alignment: Alignment.topLeft,
        margin: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Flexible(
              child: Text(
                "Socket Test",
                style: Theme.of(context).textTheme.headline4,
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(height: 25),
            SingleChildScrollView(
              child: StreamBuilder(
                stream: streamSocket.getResponse ,
                builder: (BuildContext context, AsyncSnapshot<String> snapshot){
                  return Container(
                    child: Text(snapshot.data == null ? "abc" : snapshot.data),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      drawer: MyDrawer(
          isVisible: User.loggedInUser == null
              ? false
              : User.loggedInUser.userRole == Role.Doctor
              ? true
              : false),
    );
  }
}
