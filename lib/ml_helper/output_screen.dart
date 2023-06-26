import 'dart:io';

import 'package:flutter/material.dart';
class OutputScreen extends StatelessWidget {
  final output;
  final image;
  const OutputScreen({Key? key, this.output, this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Output Screen'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Image.file(File(image!.path)),
            Text(output[0]['label'],

              style: TextStyle(
                fontSize: 20,
                color: Colors.red
                    ,
              ),
            ),
            SizedBox(height: 20,),
            TextButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}