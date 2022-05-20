import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/shared/Bloc/cubit.dart';
import 'package:to_do_app/shared/Bloc/states.dart';
import 'package:to_do_app/shared/Componeds/companed.dart';


class TaskScreen extends StatelessWidget {
  const TaskScreen({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
listener: (BuildContext context,AppStates state){},
    builder: (BuildContext context,AppStates state) {
      var Tasks= AppCubit.get(context).NewsTasks;

      return TaskBuilder(Tasks: Tasks ,style: Theme.of(context).textTheme.bodyText2,);
    });//




  }
}
