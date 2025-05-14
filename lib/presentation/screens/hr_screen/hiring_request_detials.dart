import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../blocs/hiring_requests/hiring_requests_block.dart';
import '../../../blocs/hiring_requests/hiring_requests_event.dart';
import '../../../blocs/hiring_requests/hiring_requests_state.dart';
import '../../../constant.dart';

import '../../widgets/appbar/custom_appbar_title.dart';
import '../../widgets/profile_detials/profile_info_hiring_request.dart';

class HiringRequestDetailsScreen extends StatefulWidget {
  final int hiringRequestId;

  const HiringRequestDetailsScreen({super.key, required this.hiringRequestId});

  @override
  State<HiringRequestDetailsScreen> createState() =>
      _HiringRequestDetailsScreenState();
}

class _HiringRequestDetailsScreenState extends State<HiringRequestDetailsScreen> {
  final Color customColor = AppColors.darkBlue;
  final Color valueColor = const Color(0xFF0F6829);

  @override
  void initState() {
    super.initState();
    BlocProvider.of<HiringRequestsBloc>(context).add(
      GetHiringRequestsById(hiringRequestId: widget.hiringRequestId),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: customAppBar("Hiring Request"),
      body: BlocConsumer<HiringRequestsBloc, HiringRequestsState>(
        listener: (context, state) {
          if (state is HiringRequestsFail) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errmsg),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is HiringRequestsLoadedSuccessfully) {
             return ProfileInfoHiringRequest(request: state.hiringRequestModel);

          } else if (state is HiringRequestsFail) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "There is an error:",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    state.errmsg,
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
