import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:to_do_app/modules/UpdateScreen/update.dart';
import 'package:to_do_app/shared/Bloc/cubit.dart';
import 'package:to_do_app/shared/Constans/constans.dart';
import 'package:to_do_app/shared/Styles/colors.dart';
import 'package:to_do_app/shared/Styles/theme/cubit/cubit.dart';

Widget defultTextFormField ({TextEditingController controller,TextInputType type,String label,VoidCallback ontap,IconData prefixIcon,TextStyle style
})=>TextFormField(

  validator:(value){
    if(value.isEmpty)
    {
      return 'please Enter Text';
    }
    return null;

  },

  style: TextStyle(color: TextColor),

  controller:controller,
  onTap: ontap,
  keyboardType: type,
  decoration: InputDecoration(
    //fillColor: Colors.white,
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color:PrimaryColor, ),
      borderRadius: BorderRadius.circular(25.0),
    ),
    labelText: label,
    labelStyle: TextStyle(color:PrimaryColor,),
    prefixIcon: Icon(prefixIcon,color:PrimaryColor,),
    border: OutlineInputBorder(),


  ),

);


Widget BuildTaskItem(Map model,context,Color BuildTaskColor)=>Padding(
  padding: const EdgeInsets.only(right: 8,left: 8,top: 8),
  child:  Dismissible(
    key:Key(model['id'].toString()) ,
    direction: DismissDirection.endToStart,
    background: Container(
      alignment: AlignmentDirectional.centerEnd,
      color: Colors.red[500],
      child: Padding(
          padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('Delete item',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white)),
              SizedBox(width: 5,),
              Icon(Icons.delete, color: Colors.white,size: 28),
            ],


          )


      ),
    ),
    onDismissed: (direction) {
      AppCubit.get(context).DeleteDataBase(id:model['id']);
    },


    child: Container(
      height: 120,
      width: double.infinity,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),
        color: BuildTaskColor ,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children:[
            CircleAvatar(
              backgroundColor:Colors.purple ,
              radius: 45,
              child: Text('${model['time']}'),
            ),
            SizedBox(width: 22,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                //mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('${model['title']}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black54),),
                  SizedBox(height: 5,),
                  Text('${model['date']}',style: TextStyle(fontSize: 15,color:Colors.black38),),

                ],
              ),
            ),
            SizedBox(width: 22,),
            IconButton(onPressed: (){
              AppCubit.get(context).UpdateDataBaseScreen(id:model['id'],status: 'Done');
            }, icon:Icon( Icons.check_box,color: Colors.green,)),
            IconButton(onPressed: (){
              AppCubit.get(context).UpdateDataBaseScreen(id:model['id'],status: 'Archive');
            }, icon:Icon( Icons.archive,color: Colors.blue,)),



          ],
        ),
      ),

    ),

  ),
);


Widget TaskBuilder({@required Tasks,@required TextStyle style})=>ConditionalBuilder(

  builder: (context)=>ListView.builder(itemBuilder:(context,index)=> InkWell(
      onTap: (){
        NavigateTo(router:UpdateScreen(id:Tasks[index]['id'],time:Tasks[index]['time'],database:database,date:Tasks[index]['date'],title:Tasks[index]['title'])
            ,context: context);
      },

      child: BuildTaskItem(Tasks[index], context, ThemeAppCubit.get(context).IsDark ? Colors.grey[600]: Colors.grey[300])),itemCount:Tasks.length,),
  condition:Tasks.length>0,
  fallback:(context)=>  Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon( Icons.menu,color:PrimaryColor,size: 100),

        Text('No Tasks yet , Please Add Some Tasks',style:style),

      ],
    ),
  ),
);





