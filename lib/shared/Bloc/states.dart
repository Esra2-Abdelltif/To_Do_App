 import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class AppStates
{
  const AppStates();
}

class InitialAppState extends AppStates {}
class AppChangeBottomNavBarState extends AppStates {}
 class AppCreateDataBaseState extends AppStates {}
 class AppGetDataBaseState extends AppStates {}
 class AppUpdatetDataBaseScreenState extends AppStates {}
 class AppDeleteDataBaseState extends AppStates {}
 class AppDeleteAllDataBaseState extends AppStates {}
 class AppGetDataBaseLoadingState extends AppStates {}
 class AppInsertDataBaseState extends AppStates {}
 class AppChangeBottomSheetState extends AppStates {}

 class AppUpdatetDataBaseItemState extends AppStates {}




