import 'package:flutter/material.dart';
import 'package:flutter_joystick/flutter_joystick.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:graduationupdate/colors/app_colors.dart';
import 'package:image_picker/image_picker.dart';

import '../../ml_helper/ml_helper.dart';
import '../../ml_helper/output_screen.dart';


const ballSize = 20.0;
const step = 10.0;

class JoystickExample extends StatefulWidget {
  const JoystickExample({Key? key}) : super(key: key);

  @override
  _JoystickExampleState createState() => _JoystickExampleState();
}

class _JoystickExampleState extends State<JoystickExample> {
  double _x = 100;
  double _y = 100;
  JoystickMode _joystickMode = JoystickMode.all;

  @override
  void didChangeDependencies() {
    _x = MediaQuery.of(context).size.width / 2 - ballSize / 2;
    super.didChangeDependencies();
  }
  var Image;
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
  pickImage()async{
    var Pimage=await ImagePicker().pickImage(source: ImageSource.camera);
    if(Pimage==null)return null;
    setState(() {
      Image=Pimage;
    });
    var output=await runModelOnImage(ImagePath: Pimage!.path);
    Navigator.push(context, MaterialPageRoute(builder: (context)=>OutputScreen(output: output,image: Image,)));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadModel();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Scaffold(
        backgroundColor: AppColors.pageBackground,
        body: SafeArea(
            child: Column(
              children: [
                Container(
                  color: Colors.blue,
                  width: double.infinity,
                  height: 250,

                ),
                      SizedBox(
                        height: 30,
                      ),


                      Center(
                        child: ElevatedButton(
                            style: ButtonStyle(
                              minimumSize: MaterialStateProperty.all<Size>(Size(130, 130)),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(70.0),
                                  )
                              ),
                              elevation: MaterialStateProperty.all<double>(7),
                              backgroundColor: MaterialStateProperty.all<Color>(AppColors.mainGridLineColor),
                            ),
                            onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => PlanetDiseasClassify()),
                              );
                            }, child: Icon(Icons.image)),
                      ),




                // Spacer(flex: 1),
                // Row(
                //   children: [
                //     Container(
                //       width: 170,
                //       child: Joystick(
                //         mode: _joystickMode,
                //         listener: (details) {
                //           setState(() {
                //             _x = _x + step * details.x;
                //             _y = _y + step * details.y;
                //           });
                //         },
                //       ),
                //     ),
                //     Spacer(flex: 1,),
                //     Container(
                //       width: 170,
                //       child: Joystick(
                //         mode: _joystickMode,
                //         listener: (details) {
                //           setState(() {
                //             _x = _x + step * details.x;
                //             _y = _y + step * details.y;
                //           });
                //         },
                //       ),
                //     ),
                //   ],
                // ),
                // Spacer(flex: 2,),




              ],
            )
        ),
      ),
    );
  }
}


