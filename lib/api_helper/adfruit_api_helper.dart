import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import 'model.dart';

class TempHumidAPI {
  static String username = 'Smart_System2023';
  //static String aioKey='aio_wyxp85tXMC0gXsOcsBdAGXEXr5kr';
   static String? aioKey = dotenv.env['aio_wyxp85tXMC0gXsOcsBdAGXEXr5kr']
      .toString();
  static String tempFeed = 'temp';
  static String humidFeed = 'hum';
  static String gasFeed = 'gas';
  static String rgbFeed = 'color';
  static String mainURL = 'https://io.adafruit.com/api/v2/';
  var url_angle = 'https://io.adafruit.com/api/v2/Smart_System2023/feeds/led1';
  static String led = 'led1';
  static String led2 = 'led2';
  static String led3 = 'led3';

  // static Future<bool> updateLed1Data(String value) async {
  //   http.Response response = await http.post(
  //     Uri.parse(mainURL + '$username/feeds/$led1Feed/data'),
  //     headers: <String, String>{
  //       'X-AIO-Key': aioKey!,
  //       'Content-Type': 'application/json',
  //     },
  //     body: jsonEncode({
  //       "datum": {"value": value}
  //     }),
  //   );
  //   if (response.statusCode == 200) {
  //     return true;
  //   } else {
  //     throw Error();
  //   }
  // }

  // static Future<AdafruitGET> getTempData() async {
  //   http.Response response = await http.get(
  //     Uri.parse(mainURL + '$username/feeds/$tempFeed'),
  //
  //     headers: <String, String>{'X-AIO-Key': aioKey!},
  //   );
  //   if (response.statusCode == 200) {
  //     return AdafruitGET.fromRawJson(response.body);
  //   } else {
  //     throw Error();
  //   }
  // }
  // static Future<AdafruitGET> getAngleData() async {
  //   http.Response response = await http.get(
  //     Uri.parse(mainURL + '$username/feeds/$angleFeed'),
  //
  //     headers: <String, String>{'X-AIO-Key': aioKey!},
  //   );
  //   if (response.statusCode == 200) {
  //     return AdafruitGET.fromRawJson(response.body);
  //   } else {
  //     throw Error();
  //   }
  // }
//   static Future<AdafruitGET> getHumidData() async {
//     http.Response response = await http.get(
//       Uri.parse(mainURL + '$username/feeds/$humidFeed'),
//       headers: <String, String>{'X-AIO-Key': aioKey!},
//     );
//     if (response.statusCode == 200) {
//       return AdafruitGET.fromRawJson(response.body);
//     } else {
//       throw Error();
//     }
//   }
//
  static Future getTempData() async {
    http.Response response = await http.get(
      Uri.parse('$mainURL$username/feeds/$tempFeed'),
      headers: <String, String>{'X-AIO-Key': aioKey!},
    );
    if (response.statusCode == 200) {
     // return AdafruitGET.fromRawJson(response.body);
      return response.body;
    } else {
      throw Error();
    }
  }


  static Future getHumData() async {
    http.Response response = await http.get(
      Uri.parse('$mainURL$username/feeds/$humidFeed'),
      headers: <String, String>{'X-AIO-Key': aioKey!},
    );
    if (response.statusCode == 200) {
     // return AdafruitGET.fromRawJson(response.body);
      return response.body;
    } else {
      throw Error();
    }
  }

  static Future getGasData() async {
    http.Response response = await http.get(
      Uri.parse('https://io.adafruit.com/api/v2/Smart_System2023/feeds/gas'),
      headers: <String, String>{'X-AIO-Key': aioKey!},
    );
    if (response.statusCode == 200) {
      return AdafruitGET.fromRawJson(response.body);
     // return response.body;
    } else {
      throw Error();
    }
  }








//
  static Future updateLed1Data(String value,
      String ledFeed,

      ) async {
    http.Response response = await http.post(
      //Uri.parse(mainURL + '$username/feeds/$led1Feed/data'),
      Uri.parse('https://io.adafruit.com/api/v2/Smart_System2023/feeds/$ledFeed'),

      headers: <String, String>{
        'X-AIO-Key': aioKey!,
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "datum": {"value": value}
      }),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      print(response.statusCode);
      throw Error();
    }
  }
//
//   static Future<AdafruitGET> getRGBstatus() async {
//     http.Response response = await http.get(
//       Uri.parse(mainURL + '$username/feeds/$rgbFeed'),
//       headers: <String, String>{'X-AIO-Key': aioKey!},
//     );
//     if (response.statusCode == 200) {
//       return AdafruitGET.fromRawJson(response.body);
//     } else {
//       throw Error();
//     }
//   }
//
//   static Future<bool> updateRGBdata(String value) async {
//     http.Response response = await http.post(
//       Uri.parse(mainURL + '$username/feeds/$rgbFeed/data'),
//       headers: <String, String>{
//         'X-AIO-Key': aioKey!,
//         'Content-Type': 'application/json',
//       },
//       body: jsonEncode({
//         "datum": {"value": value}
//       }),
//     );
//     if (response.statusCode == 200) {
//       return true;
//     } else {
//       throw Error();
//     }
//   }
// }
}
