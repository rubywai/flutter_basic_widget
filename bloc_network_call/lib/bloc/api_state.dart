part of 'api_bloc.dart';

@immutable
abstract class ApiState {}

class FirstScreenState extends ApiState{}
class ApiLoading extends ApiState{}
class ApiSuccess extends ApiState{
  final String data;
  ApiSuccess(this.data);
}
class ApiFailed extends ApiState{}
