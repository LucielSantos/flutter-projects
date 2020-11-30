import 'package:codiv_tracking/models/country.dart';
import 'package:codiv_tracking/models/state.dart';
import 'package:codiv_tracking/widgets/customText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StateCard extends StatelessWidget {
  StateDetailModel stateDetailModel;

  StateCard(this.stateDetailModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.greenAccent[700],
          width: 2,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: SizedBox(
        height: 220,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 20),
                  child: Icon(
                    Icons.check,
                    color: Colors.greenAccent[700],
                    size: 30,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: CustomText(stateDetailModel.cases, 'secondary'),
                ),
                CustomText('Casos', 'primary')
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 20),
                  child: Icon(
                    Icons.warning,
                    color: Colors.greenAccent[700],
                    size: 30,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: CustomText(stateDetailModel.suspects, 'secondary'),
                ),
                CustomText('Suspeitos', 'primary')
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 20),
                  child: Icon(
                    Icons.delete_outline,
                    color: Colors.greenAccent[700],
                    size: 30,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: CustomText(stateDetailModel.refuses, 'secondary'),
                ),
                CustomText('Descartados', 'primary')
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 20),
                  child: Icon(
                    Icons.close,
                    color: Colors.greenAccent[700],
                    size: 30,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: CustomText(stateDetailModel.deaths, 'secondary'),
                ),
                CustomText('Mortes', 'primary')
              ],
            ),
          ],
        ),
      ),
    );
  }
}
