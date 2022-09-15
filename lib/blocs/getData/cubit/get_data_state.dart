part of 'get_data_cubit.dart';

abstract class GetDataState extends Equatable {
  const GetDataState();

  @override
  List<Object> get props => [];
}

class GetDataInitial extends GetDataState {}

class GetDataLoading extends GetDataState {}

class GetDataSuccess extends GetDataState {
  final List<Articles>? articles;
  const GetDataSuccess(this.articles);

  @override
  List<Object> get props => [articles!];

  @override
  bool? get stringify => true;
}

class GetDataError extends GetDataState {}
