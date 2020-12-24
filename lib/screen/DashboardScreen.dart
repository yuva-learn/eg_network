import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  Response response;
  String _url = "https://corona.lmao.ninja/v2/all";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
      ),
      body: _getBody(),
    );
  }

  Widget _getBody() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Text("Network requests using Dio dart package"),
          Divider(height: 20),
          TextFormField(
            initialValue: _url,
            onChanged: (val) {
              _url = val;
            },
          ),
          RaisedButton.icon(
            color: Colors.amber,
            onPressed: getDataFromNetwork,
            icon: Icon(Icons.search),
            label: Text("Get Data"),
          ),
          response != null ? Text(response.toString()) : Container()
        ],
      ),
    );
  }

  void getDataFromNetwork() async {
    response = await Dio().get(_url);
    print(response.toString());
    setState(() {});
  }
}
