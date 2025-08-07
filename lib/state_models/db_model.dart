import 'package:apparel/data/dress_database.dart';
import 'package:flutter/material.dart';

class DbModel extends ChangeNotifier {
  final DressDatabase database;

  DbModel({required this.database});
}
