import 'package:bloc/bloc.dart';
import 'package:bloc_network_call/data/api_service.dart';
import 'package:meta/meta.dart';

part 'api_event.dart';
part 'api_state.dart';

class ApiBloc extends Bloc<ApiEvent, ApiState> {
  ApiBloc() : super(FirstScreenState()) {
    on<GetDataEvent>((event, emit) async {
      emit(ApiLoading());
      try {
        String str = await getData();
        emit(ApiSuccess(str));
      } catch (e) {
        emit(ApiFailed());
      }
    });
  }
}
