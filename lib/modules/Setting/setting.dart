import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/shared/Bloc/cubit.dart';
import 'package:to_do_app/shared/Bloc/states.dart';
import 'package:to_do_app/shared/Constans/constans.dart';
import 'package:to_do_app/shared/Styles/colors.dart';
import 'package:to_do_app/shared/Styles/theme/cubit/cubit.dart';
import 'package:to_do_app/shared/Styles/theme/cubit/states.dart';

class Setting extends StatelessWidget {
  const Setting({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<AppCubit,AppStates>(
        listener: (BuildContext context,AppStates state)
        {
          if (state is AppDeleteAllDataBaseState) {Navigator.pop(context);}
        },
        builder: (BuildContext cubitcontext ,AppStates state) {
         // AppCubit cubit = AppCubit.get(context);
          return  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 24,
                ),
                Text('General Setting',  style: TextStyle(color: Color(0xFF8D8E98), fontSize: 18
                )),
                SizedBox(
                  height: 24,
                ),
                InkWell(
                  onTap: ()=> showDialog(
                    context: cubitcontext,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Delete All Items',style: TextStyle(color: Colors.white, fontSize: 18)),
                      content: const Text('Do You sure ?',  style: TextStyle(color: Colors.white, fontSize: 18)),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Cancel',  style: TextStyle(color: Colors.white, fontSize: 18)),
                        ),
                        TextButton(
                          onPressed: () {
                           AppCubit.get(cubitcontext).deleteAll(db:database);
                          },
                          child: const Text('OK',  style: TextStyle(color:Colors.white, fontSize: 18)),
                        ),
                      ],
                      elevation: 24,
                      backgroundColor: PrimaryColor,
                      // shape: CircleBorder(),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          color: PrimaryColor,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Icon(
                          Icons.delete_forever,
                          color: Colors.white,
                          size: 22,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Delete All', style: Theme.of(context).textTheme.bodyText2,),


                    ],
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Icon(
                        Icons.brightness_2_outlined,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Dark Mode',
                      style: Theme.of(context).textTheme.bodyText2,),
                    Spacer(),
                    SwitchTheme(),


                  ],
                ),

              ],
            ),
          );
        }

    );
}
}

class SwitchTheme extends StatelessWidget {
  const SwitchTheme({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer< ThemeAppCubit,  ThemeAppStates>(
      listener: (BuildContext context,  ThemeAppStates state) {},
      builder: (BuildContext context,   ThemeAppStates state) {
        return CupertinoSwitch(
          value:  ThemeAppCubit.get(context).IsDark,
          activeColor: Theme.of(context).primaryColor,
          onChanged: (value) {
            ThemeAppCubit.get(context).ChangeAppMode();
          },
        );
      },
    );
  }
}
