import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/lawyer_bloc/lawyer_bloc.dart';
import '../../blocs/lawyer_bloc/lawyer_event.dart';
import '../../blocs/lawyer_profile_bloc/lawyer_profiel_bloc.dart';
import '../../data/models/lawyer_model.dart';
import '../screens/lawyer_screens/lawyer_profile_screens/lawyer_details_screen.dart';
import 'info_row.dart';

class LawyerItem extends StatelessWidget {
  const LawyerItem({super.key, required this.lawyer});
  final LawyerModel lawyer;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => LawyerProfileBloc(),
              child: LawyerDetailsScreen(
                lawyerId: lawyer.id,
              ),
            ),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            20,
          ),
        ),
        elevation: 6,
        shadowColor: Colors.deepPurple.withOpacity(0.3),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                lawyer.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Color(0XFF472A0C),
                ),
              ),
              const SizedBox(height: 8),
              InfoRow(
                  title: 'Experience:',
                  value: '${lawyer.experienceYears} years'),
              InfoRow(title: 'Specialization:', value: lawyer.specialization),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                  onPressed: () {
                    BlocProvider.of<LawyerBloc>(context).add(
                      DeleteLawyerByIdEvent(lawyerId: lawyer.id),
                    );
                  },
                  icon: const Icon(Icons.delete, color: Colors.red),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
