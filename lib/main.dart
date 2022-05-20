import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/Layout/HomeScreen.dart';
import 'package:to_do_app/shared/Network/local/cacheHelper.dart';
import 'package:to_do_app/shared/Styles/theme/cubit/cubit.dart';
import 'package:to_do_app/shared/Styles/theme/cubit/states.dart';
import 'package:to_do_app/shared/Styles/theme/theme.dart';
import 'shared/Bloc/observer_bloc.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  bool IsDark =CacheHelper.getDate(key: 'IsDark');
  BlocOverrides.runZoned( () {
    runApp( MyApp(IsDark));

  },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  final bool IsDark;
  MyApp(this.IsDark);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context )=> ThemeAppCubit()..ChangeAppMode(fromShared: IsDark))
      ],
      child: BlocConsumer<ThemeAppCubit,ThemeAppStates>(
        listener: (context ,state){},
        builder: (context ,state){
          return  MaterialApp(
            theme: lightthemes,
            darkTheme: darkthemes,
            themeMode: ThemeAppCubit.get(context).IsDark ? ThemeMode.dark :ThemeMode.light ,
            debugShowCheckedModeBanner: false,
            home:HomeScreen(),
          );
        },
      ),
    );
  }
}

