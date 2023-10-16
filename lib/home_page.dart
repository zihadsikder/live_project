import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDo'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
        },
        child: Icon(Icons.add),
      ),
      body: ListView.separated(
        itemCount: 10,
          itemBuilder: (context, index){
        return ListTile(
          leading: CircleAvatar(
            child: Text('${index}'),
          ),
          title: Text('sdfer'),
          subtitle: Text('12.10.2023'),
          trailing: Text('pending'),

        );

    }, separatorBuilder: (BuildContext context, int index) {
          return const Divider(); },),
    );
  }
}
