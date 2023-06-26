import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graduationupdate/colors/colors.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../login_signup/login.dart';
import 'home_screen.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  OnBoardingPageState createState() => OnBoardingPageState();
}

class OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) =>  LoginScreen()),
    );
  }


  Widget _buildImage(String assetName, [double width = 250]) {
    return Image.asset('images/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0,color: Colors.white);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700 , color: Colors.white),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: AppColors.pageBackground,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: AppColors.pageBackground,
      allowImplicitScrolling: true,
      autoScrollDuration: 3000,
      pages: [
        PageViewModel(
          title: "Graduation Project",
          body:
          "Smarting Farm : This project was implemented by a team of students from the Faculty of Artificial Intelligence",
          image: _buildImage('graduation1.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "About Project",
          body:'A smart farm is an agricultural system that uses advanced technologies such as the Internet of Things (IoT), sensors, automation, and data analytics to optimize farming operations and improve productivity. The main objective of smart farming is to increase efficiency, reduce costs, and minimize the environmental impact of agriculture.',
          image: _buildImage('info.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "About Team",
          body:'Our team has been working tirelessly to create a system that is both efficient and sustainable, and we believe that our smart farm is a game-changer in the agricultural industry. Through the integration of IoT technology, we are able to collect data in real-time to monitor the health and growth of crops, as well as the overall environment in which they are grown. This data is then analyzed and used to make informed decisions about watering, fertilizing, and other important aspects of crop management.',
          image: _buildImage('team.png'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: false,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: true,
      //rtl: true, // Display as right-to-left
      back: const Icon(Icons.arrow_back),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.black87,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}

