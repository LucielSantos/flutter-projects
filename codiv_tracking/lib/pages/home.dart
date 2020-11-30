import 'package:codiv_tracking/models/country.dart';
import 'package:codiv_tracking/pages/state.dart';
import 'package:codiv_tracking/services/country.dart';
import 'package:codiv_tracking/utils/states.dart';
import 'package:codiv_tracking/widgets/countryCard.dart';
import 'package:codiv_tracking/widgets/customText.dart';
import 'package:codiv_tracking/widgets/loadingIndicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = true;
  CountryModel countryData;
  CountryService countryService;

  @override
  void initState() {
    super.initState();
    countryService = CountryService();
    getCountryData();
  }

  void getCountryData() async {
    setState(() {
      isLoading = true;
    });

    CountryModel countryResponse = await countryService.getCountryData();

    setState(() {
      countryData = countryResponse;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('COVID TRAKING'),
        backgroundColor: Colors.greenAccent[700],
      ),
      backgroundColor: Color(0xFF202124),
      body: isLoading
          ? LoadingIndicator()
          : SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: _buildCountryCard(),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CustomText(
                        'Lista de estados brasileiros:', 'secondary'),
                  ),
                  _buildStatesList(),
                ],
              ),
            ),
    );
  }

  Widget _buildCountryCard() {
    return CountryCard(countryData);
  }

  Widget _buildStatesList() {
    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(
        height: 2,
        width: double.infinity,
        child: Container(
          margin: EdgeInsets.only(left: 10, right: 10),
          color: Colors.greenAccent[700],
        ),
      ),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: brazilStates.length,
      itemBuilder: (context, index) => _buildStateLine(brazilStates[index]),
    );
  }

  Widget _buildStateLine(StateModel state) {
    return InkWell(
      onTap: () => _handleNavigateToState(state),
      child: Padding(
        padding: EdgeInsets.only(bottom: 20, left: 25, right: 25, top: 20),
        child: CustomText(state.name, 'primary'),
      ),
    );
  }

  void _handleNavigateToState(StateModel state) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return StatePage(state);
    })).then((result) {
      getCountryData();
    });
  }
}
