
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddNotes extends StatefulWidget {
  const AddNotes({Key? key}) : super(key: key);

  @override
  State<AddNotes> createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
  late File image;
  final imaepicker=ImagePicker();

  upload()async{
    var img=await imaepicker.getImage(source: ImageSource.camera);
    image=File(img!.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(title: Text("Add Notes"),),
    body: Container(
      child: Column(
        children: [

      Form(
          child: Column(
            children: [
              TextFormField(
                maxLength:30,
                decoration:InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: "Add Title Note",
                prefixIcon: Icon(Icons.title)
              ) ,),
              SizedBox(width: 60,),
              TextFormField(
                minLines: 1,
                maxLines: 3,
                maxLength: 200,
                decoration:InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: "Add Note",
                  prefixIcon: Icon(Icons.notes)
              ) ,),
           ElevatedButton(onPressed: upload(),
           child: Text("Add Image"),
           ),
              Center(
                child:ElevatedButton(
           onPressed: (){

           },
                  child: Text("Add This Note"),
                ),
              )
            ],
          ))
          ],
      )
    ),
    );
  }
}
