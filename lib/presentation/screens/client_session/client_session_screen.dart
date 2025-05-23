import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/blocs/show_client_sessions_bloc/show_client_sessions_bloc.dart';

class ShowClientSessionsScreen extends StatelessWidget {
  const ShowClientSessionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF7C7C56),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: BlocBuilder<ShowClientSessionsBloc, ShowClientSessionsState>(
            builder: (context, state) {
              if (state is ShowClientIssuesLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ShowClientIssuesFail) {
                return Center(child: Text('خطأ: ${state.errmsg}'));
              } else if (state is ShowClientIssuesListLoadedSuccessFully) {
                final sessions = state.clientsession; // قائمة الجلسات

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text(
                        'القضايا والجلسات',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Expanded لاحتواء ListView
                    Expanded(
                      child: ListView.builder(
                        itemCount: sessions.length,
                        itemBuilder: (context, index) {
                          final session = sessions[index];
                          return Container(
                            margin: const EdgeInsets.only(bottom: 12),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    '↞ القضية رقم: ${session.issue.issueNumber}'),
                                const SizedBox(height: 8),
                                Text('العنوان: ${session.issue.title}'),
                                const SizedBox(height: 8),
                                Text('نوع القضية: ${session.issue.category}'),
                                const SizedBox(height: 8),
                                Text('المحكمة: ${session.issue.courtName}'),
                                const SizedBox(height: 8),
                                ListView.builder(
                                    itemCount: session.sessions.length,
                                    itemBuilder: (context, index) {
                                      final s = session.sessions[index];
                                      return Container(
                                          margin:
                                              const EdgeInsets.only(bottom: 12),
                                          padding: const EdgeInsets.all(16),
                                          decoration: BoxDecoration(
                                            color: Colors.grey.shade200,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('↞ الجلسة  رقم: ${s.id}'),
                                              const SizedBox(height: 8),

                                              Text('${s.isAttend}'),
                                              const SizedBox(height: 8),
                                              Text(': ${s.outcome}'),
                                              const SizedBox(height: 8),
                                            ],
                                          ));
                                    })
                              ],
                            ),
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 16),
                    Row(
                      children: const [
                        Icon(Icons.copy, size: 28),
                        SizedBox(width: 16),
                        Icon(Icons.add, size: 28),
                        SizedBox(width: 16),
                        Icon(Icons.edit, size: 28),
                      ],
                    ),
                    const SizedBox(height: 24),
                    const Text('اختر تاريخ انتهاء الطلب'),
                    const SizedBox(height: 8),
                    const Text('سبب طلب الإجازة'),
                  ],
                );
              } else {
                return const Center(child: Text('لا توجد بيانات'));
              }
            },
          ),
        ),
      ),
    );
  }
}
