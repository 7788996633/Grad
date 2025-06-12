import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/blocs/lawyer_profile_bloc/lawyer_profiel_bloc.dart';
import 'package:intl/intl.dart';

import '../../../data/models/demand_model.dart';

class DemandDetailsScreen extends StatefulWidget {
  const DemandDetailsScreen({super.key, required this.demandModel});
  final DemandModel demandModel;

  @override
  State<DemandDetailsScreen> createState() => _DemandDetailsScreenState();
}

class _DemandDetailsScreenState extends State<DemandDetailsScreen> {
  @override
  void initState() {
    BlocProvider.of<LawyerProfileBloc>(context).add(
      ShowLawyerProfileByIdEvent(
        lawyerId: widget.demandModel.lawyerId,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String date = DateFormat('yyyy-MM-dd').format(widget.demandModel.date);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          date,
        ),
      ),
      body: BlocBuilder<LawyerProfileBloc, LawyerProfileState>(
        builder: (context, state) {
          if (state is LawyerProfileLoadedSuccessfully) {
            return Column(
              children: [
                Text(
                  "Responsible Lawyer:",
                ),
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height * 0.2,
                  child: Card(
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                            state.lawyerModel.image,
                          ),
                        ),
                        Text(
                          state.lawyerModel.name,
                        ),
                      ],
                    ),
                  ),
                ),
                Text(widget.demandModel.resault ?? "There is no resault yet"),
              ],
            );
          } else if (state is LawyerProfileFail) {
            return Text("Something went wrong: ${state.errmsg}");
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
