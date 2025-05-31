import 'package:flutter/material.dart';

import '../../data/models/demand_model.dart';
import '../screens/AttendDemand/demand_details_screen.dart';

class DemandItem extends StatelessWidget {
  const DemandItem({super.key, required this.demandModel});
  final DemandModel demandModel;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => DemandDetailsScreen(
                demandModel: demandModel,
              ),
            ),
          );
        },
        title: Text(
          "${demandModel.id}",
        ),
      ),
    );
  }
}
