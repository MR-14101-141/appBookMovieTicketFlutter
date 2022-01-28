import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:appdatvexemphim/Bloc/DienVien/event_dienvien.dart';
import 'package:appdatvexemphim/Bloc/DienVien/state_dienvien.dart';
import 'package:appdatvexemphim/repository/Model/dienvien.dart';
import 'package:appdatvexemphim/repository/dienvien_repository.dart';

class DienVienBloc extends Bloc<DienVienEvent, DienVienState> {
  final _dienvienRepository = DienVienRepository();

  DienVienBloc() : super(DienVienLoading()) {
    on<LoadDsDienVien>(_onLoadDsDienVien);
  }

  void _onLoadDsDienVien(
      LoadDsDienVien event, Emitter<DienVienState> emit) async {
    List<DienVien> lst = List.empty();
    try {
      lst = await _dienvienRepository.loadDsDienVien();
      emit(LoadDsDienVienSucess(lst));
    } catch (e) {
      emit(LoadDsDienVienFail(e.toString()));
    }
  }
}
