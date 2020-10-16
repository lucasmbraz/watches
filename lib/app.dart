import 'package:flutter/material.dart';
import 'package:watches/details_screen.dart';
import 'package:watches/model/dummy_data.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DetailsScreen(
        watch: watches[0],
      ),
    );
  }
}
