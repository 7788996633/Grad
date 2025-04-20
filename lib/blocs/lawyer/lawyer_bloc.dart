import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/lawyer_repository.dart';
import 'lawyer_event.dart';
import 'lawyer_state.dart';

class LawyerBloc extends Bloc<LawyerEvent, LawyerState> {
  final LawyerRepository _repository = LawyerRepository();

  LawyerBloc() : super(LawyerInitial()) {
    // تحميل جميع المحامين
    on<FetchAllLawyers>((event, emit) async {
      emit(LawyerLoading());
      try {
        final lawyers = await _repository.fetchAllLawyers();
        emit(LawyersLoaded(lawyers));
      } catch (e) {
        emit(LawyerError(e.toString()));
      }
    });

    // تحميل محامي حسب ID
    on<FetchLawyerById>((event, emit) async {
      emit(LawyerLoading());
      try {
        final lawyer = await _repository.fetchLawyerById(event.id);
        emit(LawyerLoaded(lawyer));
      } catch (e) {
        emit(LawyerError(e.toString()));
      }
    });

    // تحميل بروفايل المحامي الحالي
    on<LoadLawyerEvent>((event, emit) async {
      emit(LawyerLoading());
      try {
        final lawyer = await _repository.fetchProfile();
        emit(LawyerLoaded(lawyer));
      } catch (e) {
        emit(LawyerError(e.toString()));
      }
    });

    // تحديث راتب المحامي
    on<UpdateLawyerSalaryEvent>((event, emit) async {
      emit(LawyerLoading());
      try {
        final updatedLawyer = await _repository.updateSalary(event.salary);
        emit(LawyerLoaded(updatedLawyer));
      } catch (e) {
        emit(LawyerError(e.toString()));
      }
    });
  }
}
