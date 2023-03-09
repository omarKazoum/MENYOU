import 'dart:convert';

import 'package:OnTimeDining/main_widget.dart';
import 'package:flutter/material.dart';

import 'app_service.dart';


void main() {
  runApp(MainScreen(appService:AppService()));

}
