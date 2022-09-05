import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List notes=[
    {
      "note": "Have appointment at 6 pm",
      "image":"1.jpeg",
    },
    {
      "note": "Have appointment at 6 pm Have appointment at 6 pm",
      "image":"1.jpeg",
    },
    {
      "note": "Have a data with BF",
      "image":"1.jpeg",
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.of(context).pushNamed("addnotes");
        },
      ) ,
      appBar: AppBar(
        title:Center(child: Text("Home Page")),
      ),
      body: Container(
        child: ListView.builder(
            itemCount:notes.length ,
            itemBuilder: (context,i)
            {
              return Dismissible(key: Key("$i"), child: ListNotes(
                notes:notes[i] ,
              ),
              );
            }

        ),
      ),
    );
  }
}

class ListNotes extends StatelessWidget
{
  final notes;
  ListNotes({this.notes});
  @override
  Widget build(BuildContext context) {
   return Card(
     child: Row(
       children:[
         Expanded(
             flex: 1,child: Image.asset("images/Login.jpeg")),
      Expanded(
          flex: 2,child:ListTile(
        title: Text("Title"),
          subtitle: Text("${notes['note']}"),
         trailing: IconButton(onPressed: (){}, icon: Icon(Icons.edit),),
       )
      ),
       ]
     ),
   );
  }

}