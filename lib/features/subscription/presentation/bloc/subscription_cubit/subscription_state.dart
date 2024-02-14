part of 'subscription_cubit.dart';

sealed class SubscriptionState extends Equatable {
  const SubscriptionState();

  @override
  List<Object> get props => [];
}

final class SubscriptionInitial extends SubscriptionState {}

final class SubscriptionStart extends SubscriptionState {}

final class SubscriptionSuccess extends SubscriptionState {}

final class SubscriptionFailed extends SubscriptionState {}
