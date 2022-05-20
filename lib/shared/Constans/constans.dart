import 'package:flutter/material.dart';
import 'package:sqflite/sqlite_api.dart';

Database database;
void NavigateTo({context,router})=>  Navigator.push(context,MaterialPageRoute(builder: (context) => router));
