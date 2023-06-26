import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LottieBuilder.asset('images/hellomanger.json'),
        SizedBox(height: 8,),
        Text('Hello Manager',style: TextStyle(
            fontFamily: 'Pacifico',
            fontSize: 40,
          color: Colors.white

        ),),
      ],
    );
  }
}
