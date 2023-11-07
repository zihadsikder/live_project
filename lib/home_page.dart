
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Todo>todo=[];
  TextEditingController fild1=TextEditingController();
  TextEditingController fild2=TextEditingController();
  TextEditingController todoTEController1=TextEditingController();
  TextEditingController todoTEController2=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        actions: [
          Icon(Icons.search),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextFormField(
              controller: fild1,
              decoration: InputDecoration(
                hintText: 'Title',
                border:OutlineInputBorder(),
              ),),
            SizedBox(height: 8,),
            TextFormField(
              controller: fild2,
              decoration: InputDecoration(
                hintText: 'Description',
                border:OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 8,),
            ElevatedButton(onPressed:(){
              String str1=fild1.text.trim();
              String str2=fild2.text.trim();
              Todo todoo=Todo(str1,str2);
              todo.add(todoo);
              fild1.text='';
              fild2.text='';
              setState(() {});
            },
              child:Text('Add',style: TextStyle(fontWeight: FontWeight.bold),),
              style:ElevatedButton.styleFrom(
                  backgroundColor: Colors.red
              ),
            ),
            SizedBox(height: 30,),
            Expanded(
              flex: 70,
              child: ListView.builder(
                  itemCount: todo.length,
                  itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        tileColor: Colors.grey.shade200,
                        leading: CircleAvatar(
                          backgroundColor: Colors.red,
                        ),
                        title:Text(todo[index].name),
                        subtitle:Text(todo[index].description),
                        trailing: Icon(Icons.arrow_forward),
                        onLongPress: (){
                          showDialog(
                              context: context, builder:(context){
                            return AlertDialog(
                              title: Text('Alert',style:TextStyle(fontWeight: FontWeight.bold),),
                              actions: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextButton(
                                        onPressed:(){
                                          Navigator.pop(context);
                                          showModalBottomSheet(
                                              context: context, builder:(context){
                                            return Padding(
                                              padding: const EdgeInsets.all(16.0),
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  TextFormField(
                                                    controller: todoTEController1,
                                                    decoration: InputDecoration(
                                                      hintText: 'Enter you new to do',
                                                      border: OutlineInputBorder(),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  TextFormField(
                                                    controller: todoTEController2,
                                                    decoration: InputDecoration(
                                                      hintText: 'Enter your description',
                                                      border: OutlineInputBorder(),
                                                    ),
                                                  ),
                                                  SizedBox(height: 10,),
                                                  SizedBox(
                                                    height: 45,
                                                    child: ElevatedButton(onPressed: () {
                                                      Navigator.pop(context);
                                                      String str3=todoTEController1.text.trim();
                                                      String str4=todoTEController2.text.trim();
                                                      todo[index].name=str3;
                                                      todo[index].description=str4;
                                                      todoTEController2.text='';
                                                      todoTEController1.text='';
                                                      setState(() {});
                                                    }, child: Text('Edit Done'),
                                                      style:ElevatedButton.styleFrom(
                                                          backgroundColor: Colors.red
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          }
                                          );
                                        },
                                        child:Text('Edit',style:TextStyle(color: Colors.lightBlue),)
                                    ),
                                    TextButton(
                                        onPressed:(){
                                          Navigator.pop(context);
                                          todo.removeAt(index);
                                          setState(() {});
                                        },
                                        child:Text('Delet',style:TextStyle(color: Colors.lightBlue),)
                                    ),
                                  ],
                                )
                              ],
                            );
                          }
                          );
                        },
                      ),
                    );
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class Todo{
  String name;
  String description;
  Todo(
      this.name,
      this.description,
      );
}
