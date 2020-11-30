import 'package:codiv_tracking/models/country.dart';
import 'package:codiv_tracking/widgets/customText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CountryCard extends StatelessWidget {
  CountryModel countryData;

  CountryCard(this.countryData);

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
            CustomText('Status no ${countryData.country}', 'tertiary'),
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
                  child: CustomText(countryData.confirmed, 'secondary'),
                ),
                CustomText('Confirmados', 'primary')
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
                  child: CustomText(countryData.cases, 'secondary'),
                ),
                CustomText('Ativos', 'primary')
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 20),
                  child: Icon(
                    Icons.replay,
                    color: Colors.greenAccent[700],
                    size: 30,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: CustomText(countryData.recovered, 'secondary'),
                ),
                CustomText('Recuperados', 'primary')
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
                  child: CustomText(countryData.deaths, 'secondary'),
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
