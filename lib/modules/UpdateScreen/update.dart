import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/shared/Componeds/companed.dart';
import 'package:to_do_app/shared/Styles/colors.dart';

class UpdateScreen extends StatelessWidget {
  //const UpdateScreen({Key key}) : super(key: key);
  var TitleController = TextEditingController();
  var DateController = TextEditingController();
  var TimeController = TextEditingController();
  var StatusController = TextEditingController();
  String title;
  String date;
  String time;
  int id;
  var database;
  UpdateScreen({this.title, this.date, this.time,this.id,this.database});
  @override
  Widget build(BuildContext context) {
    DateController.text=date;
    TimeController.text=time;
    TitleController.text=title;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor, centerTitle: true,
        title: Text('Update Screen',style: TextStyle(color:TextColor)),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),)),

      ),
      body: Column(
          children: [
            Container(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                child: Form(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      //Ttile
                      defultTextFormField(
                          controller: TitleController,
                          type: TextInputType.text,
                          label: 'Task Title',
                          prefixIcon: Icons.title),
                      const SizedBox(
                        height: 10,
                      ),
                      //Time
                      defultTextFormField(
                        controller: TimeController,
                        ontap: () {
                          showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          ).then((dynamic value) {
                            TimeController.text = value.format(context).toString();
                          });
                        },
                        type: TextInputType.datetime,
                        label: 'Task Time',
                        prefixIcon: Icons.watch_later_outlined,
                      ),

                      SizedBox(
                        height: 10,
                      ),
                      //Date
                      defultTextFormField(
                          controller: DateController,
                          ontap: () {
                            showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate:
                                DateTime.parse('2022-12-31'))
                                .then((dynamic value) {
                              DateController.text = DateFormat.yMMMd().format(value);

                            });
                          },
                          type: TextInputType.datetime,
                          label: 'Task Date',
                          prefixIcon: Icons.calendar_today),
                      SizedBox(height: 10,),

                    ],
                  ),
                ),
              ),
            ),

          ),
            //SizedBox(height: 40),
            Container(
              width: 300,
              height: 50,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: MaterialButton(color:PrimaryColor,hoverColor: Colors.black,
                onPressed: (){
                UpdateDataBaseitem(database:database, title: TitleController.text, date: DateController.text, time:TitleController.text,id:id).then((value) {
                    Navigator.pop(context);
                }
                );
                },
                child:Text('Save',style: TextStyle(fontSize: 20,color: Colors.white),), ),
            ),

      ]),
    );
  }
  Future <void> UpdateDataBaseitem({@required database,@required title, @required date,@required time,@required int id})async{
  await  database.rawUpdate("UPDATE Tasks SET title = ? , date = ?, time = ?, WHERE id = ?",
        ['$title', '$date','$time','$id']).then((value) {

    });

  }

}
