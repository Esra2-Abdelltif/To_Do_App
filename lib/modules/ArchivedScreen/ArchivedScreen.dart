import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/shared/Bloc/cubit.dart';
import 'package:to_do_app/shared/Componeds/companed.dart';

import '../../shared/Bloc/states.dart';

class ArchivedScreen extends StatelessWidget {
  const ArchivedScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
        listener: (BuildContext context,AppStates state){},
        builder: (BuildContext context,AppStates state) {
          var Tasks= AppCubit.get(context).ArchiveTasks;

          return TaskBuilder(Tasks: Tasks,style: Theme.of(context).textTheme.bodyText2,);

        });
  }
}
