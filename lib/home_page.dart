
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<bool> selectedItems = [false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selection Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 70,
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      tileColor: selectedItems[index] ? Colors.green : Colors.grey.shade200,
                      title: Text('Item.$index'),
                      onTap: () {
                        setState(() {
                          selectedItems[index] = !selectedItems[index];
                        });
                      },
                      trailing: selectedItems[index] ? Text('Selected', style: TextStyle(color: Colors.green)) : null,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          int selectedCount = selectedItems.where((isSelected) => isSelected).length;
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text('Number of Selected Items: $selectedCount',),
                title: Text('Selected Item',style: TextStyle(fontWeight: FontWeight.bold) ),
                actions: [

                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                    ),
                    child: Text('Close'),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.check),
      ),
    );
  }
}

// }
