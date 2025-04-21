import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'lawyer_event.dart';
part 'lawyer_state.dart';

class LawyerBloc extends Bloc<LawyerEvent, LawyerState> {
  LawyerBloc() : super(LawyerInitial()) {
    on<LawyerEvent>((event, emit) {
      if (event is CreateLawyerProfile) {}
    });
  }
}
