import 'package:flutter/material.dart';
import 'package:graduation/data/models/demand_model.dart';

class DemandDetailsScreen extends StatelessWidget {
  const DemandDetailsScreen({super.key, required this.demandModel});
  final DemandModel demandModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          demandModel.date.toString(),
        ),
      ),
      body: Column(
        children: [
          Text(
            "${demandModel.id}",
          ),
        ],
      ),
    );
  }
}
