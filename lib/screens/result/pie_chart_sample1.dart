
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:graduationupdate/api_helper/adfruit_api_helper.dart';

import '../../colors/app_colors.dart';
import '../../models/indicator.dart';

class PieChartSample1 extends StatefulWidget {
  const PieChartSample1({super.key});

  @override
  State<StatefulWidget> createState() => PieChartSample1State();
}

class PieChartSample1State extends State {
  int touchedIndex = -1;
  var humData ;
  var tempData ;
  var gasData ;

  @override
  void initState() {
    super.initState();
  humData=  TempHumidAPI.getHumData();
  tempData= TempHumidAPI.getTempData();
  gasData= TempHumidAPI.getGasData();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 28,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Indicator(
                color: AppColors.contentColorBlue,
                text: '1',
                isSquare: false,
                size: touchedIndex == 0 ? 18 : 11,
                textColor: touchedIndex == 0
                    ? AppColors.mainTextColor1
                    : AppColors.mainTextColor3,
              ),
              Indicator(
                color: AppColors.contentColorYellow,
                text: ' 2',
                isSquare: false,
                size: touchedIndex == 1 ? 18 : 12,
                textColor: touchedIndex == 1
                    ? AppColors.mainTextColor1
                    : AppColors.mainTextColor3,
              ),
              Indicator(
                color: AppColors.contentColorPink,
                text: ' 3',
                isSquare: false,
                size: touchedIndex == 2 ? 18 : 12,
                textColor: touchedIndex == 2
                    ? AppColors.mainTextColor1
                    : AppColors.mainTextColor3,
              ),
              Indicator(
                color: AppColors.contentColorGreen,
                text: ' 4',
                isSquare: false,
                size: touchedIndex == 3 ? 18 : 16,
                textColor: touchedIndex == 3
                    ? AppColors.mainTextColor1
                    : AppColors.mainTextColor3,
              ),

            ],
          ),
          const SizedBox(
            height: 18,
          ),
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: PieChart(
                PieChartData(
                  pieTouchData: PieTouchData(
                    touchCallback: (FlTouchEvent event, pieTouchResponse) {
                      setState(() {
                        if (!event.isInterestedForInteractions ||
                            pieTouchResponse == null ||
                            pieTouchResponse.touchedSection == null) {
                          touchedIndex = -1;
                          return;
                        }
                        touchedIndex = pieTouchResponse
                            .touchedSection!.touchedSectionIndex;
                      });
                    },
                  ),
                  startDegreeOffset: 180,
                  sectionsSpace: 1,
                  centerSpaceRadius: 0,
                  sections: showingSections(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(
      4,
          (i) {
        final isTouched = i == touchedIndex;
        const color0 = AppColors.contentColorBlue;
        const color1 = AppColors.contentColorYellow;
        const color2 = AppColors.contentColorPink;
        const color3 = AppColors.contentColorGreen;
        const color4 = AppColors.contentColorRed;

        switch (i) {
          case 0:
            return PieChartSectionData(
              color: color0,
              value:48,
              title: 'Temp',
              radius: 70,
              titlePositionPercentageOffset: 0.55,
              borderSide: isTouched
                  ? const BorderSide(
                  color: AppColors.contentColorWhite, width: 6)
                  : BorderSide(
                  color: AppColors.contentColorWhite.withOpacity(0)),
            );
          case 1:
            return PieChartSectionData(
              color: color1,
              value: 28,
              title: 'Humidity',
              radius: 70,
              titlePositionPercentageOffset: 0.55,
              borderSide: isTouched
                  ? const BorderSide(
                  color: AppColors.contentColorWhite, width: 6)
                  : BorderSide(
                  color: AppColors.contentColorWhite.withOpacity(0)),
            );
          case 2:
            return PieChartSectionData(
              color: color2,
              value: 112,
              title: 'Gas',
              radius: 70,
              titlePositionPercentageOffset: 0.6,
              borderSide: isTouched
                  ? const BorderSide(
                  color: AppColors.contentColorWhite, width: 6)
                  : BorderSide(
                  color: AppColors.contentColorWhite.withOpacity(0)),
            );
          // case 3:
          //   return PieChartSectionData(
          //     color: color3,
          //     value: 20,
          //     title: 'result',
          //     radius: 70,
          //     titlePositionPercentageOffset: 0.55,
          //     borderSide: isTouched
          //         ? const BorderSide(
          //         color: AppColors.contentColorWhite, width: 6)
          //         : BorderSide(
          //         color: AppColors.contentColorWhite.withOpacity(0)),
          //   );
          case 3:
            return PieChartSectionData(
              color: color4,
              value: 27,
              title: 'sound',
              radius: 70,
              titlePositionPercentageOffset: 0.55,
              borderSide: isTouched
                  ? const BorderSide(
                  color: AppColors.contentColorWhite, width: 6)
                  : BorderSide(
                  color: AppColors.contentColorWhite.withOpacity(0)),
            );
          default:
            throw Error();
        }
      },
    );
  }
}