import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:image_picker/image_picker.dart';

import 'output_screen.dart';

class PlanetDiseasClassify extends StatefulWidget {
  const PlanetDiseasClassify({Key? key}) : super(key: key);

  @override
  State<PlanetDiseasClassify> createState() => _PlanetDiseasClassifyState();
}

class _PlanetDiseasClassifyState extends State<PlanetDiseasClassify> {
  loadModel()async{
    await Tflite.loadModel(
      model: 'assets/model_unquant.tflite',
      labels: 'assets/labels.txt',
    );
  }

  runModelOnImage(
  {
    required String ImagePath,
}
      )async{
    var output=await Tflite.runModelOnImage(
      path: ImagePath,
      numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    return output;
  }

  runOnframes(
      {
        required CameraImage
      }
      )async{
    var output=await Tflite.runModelOnFrame(
      bytesList: CameraImage.planes.map((plane) {
        return plane.bytes;
      }).toList(),
      imageHeight: 0,
      imageWidth: 0,
      imageMean: 0,
      imageStd: 0,
      rotation: 0,
      numResults: 0,
      threshold: 0,
      asynch: true,
    );
    return output;
  }

  @override
   initState()  {
    // TODO: implement initState
    super.initState();
     loadModel();

  }
  var image;

  pickImage()async{
    var Pimage=await ImagePicker().getImage(source: ImageSource.gallery);
    if(Pimage==null)return null;
    setState(() {
      image=Pimage;
    });
    var output=await runModelOnImage(ImagePath: Pimage!.path);
    Navigator.push(context, MaterialPageRoute(builder: (context)=>OutputScreen(output: output,image: image,)));
  }

  @override
  Widget build(BuildContext context) {

    var image;
    return Scaffold(
      appBar: AppBar(
        title: Text('Planet Disease Classify'),
      ),
      // body: Center(
      //   child: Row(
      //     children: [
      //       Column(
      //         children: [
      //           SizedBox(height: 100,),
      //           Container(
      //             height: 250,
      //             width: 250,
      //             child: Image.asset('assets/planet.jpg'),
      //           ),
      //           SizedBox(height: 20,),
      //           TextButton(
      //               onPressed: ()async{
      //                 var output=await runModelOnImage(ImagePath: 'assets/planet.jpg');
      //                 print(output);
      //               },
      //               child: Text('Classify'),
      //           ),
      //         ],
      //       ),
      //       Column(
      //         children: [
      //           SizedBox(height: 100,),
      //           Container(
      //             height: 250,
      //             width: 250,
      //             child: Image.asset('assets/planet.jpg'),
      //           ),
      //           SizedBox(height: 20,),
      //           TextButton(
      //             onPressed: ()async{
      //               var output=await runModelOnImage(ImagePath: 'assets/planet.jpg');
      //               print(output);
      //             },
      //             child: Text('Classify'),
      //           ),
      //         ],
      //     ],
      //   ),
      // ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 100,),
            Container(
              height: 250,
              width: 250,
              child:  image == null?Container():
                Image.file(File(image!.path)),),


            SizedBox(height: 20,),
            TextButton(
              onPressed: ()async{
                // image picker
                await pickImage();




              },

              child: Text('Classify'),
            ),
          ],
        ),
      )
    );
  }
}