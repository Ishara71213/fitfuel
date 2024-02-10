import 'package:equatable/equatable.dart';

abstract class DietPlanState extends Equatable {
  const DietPlanState();

  @override
  List<Object> get props => [];
}

class DietPlanInitial extends DietPlanState {}
