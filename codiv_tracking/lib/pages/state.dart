import 'package:codiv_tracking/models/state.dart';
import 'package:codiv_tracking/services/state.dart';
import 'package:codiv_tracking/utils/states.dart';
import 'package:codiv_tracking/widgets/loadingIndicator.dart';
import 'package:codiv_tracking/widgets/stateCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatePage extends StatefulWidget {
  final StateModel state;

  StatePage(this.state);

  @override
  _StatePageState createState() => _StatePageState(this.state);
}

class _StatePageState extends State<StatePage> {
  final StateModel state;
  StateDetailModel stateDetail;
  StateService stateService;
  bool isLoading = true;

  _StatePageState(this.state);

  @override
  void initState() {
    super.initState();
    stateService = StateService();
    getStateDetail();
  }

  void getStateDetail() async {
    setState(() {
      isLoading = true;
    });

    StateDetailModel serviceResponse =
        await stateService.getStateData(state.slug);

    setState(() {
      stateDetail = serviceResponse;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${state.name} - ${state.uf}'),
        backgroundColor: Colors.greenAccent[700],
      ),
      backgroundColor: Color(0xFF202124),
      body: isLoading
          ? LoadingIndicator()
          : Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: StateCard(stateDetail),
                ),
              ],
            ),
    );
  }
}
