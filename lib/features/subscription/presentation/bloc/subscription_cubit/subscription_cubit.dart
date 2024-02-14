import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:fitfuel/core/common/domain/entities/subscription.dart';
import 'package:fitfuel/core/common/domain/entities/user_entity.dart';
import 'package:fitfuel/features/subscription/domain/usecases/subscribe_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'subscription_state.dart';

class SubscriptionCubit extends Cubit<SubscriptionState> {
  final SubscribeUsecase subscribeUsecase;

  SubscriptionCubit({required this.subscribeUsecase})
      : super(SubscriptionInitial());

  Map<String, dynamic> getPaymentModel(UserEntity user) {
    Map<String, dynamic> paymentObject = {
      "sandbox": true,
      "merchant_id": "1225812",
      "merchant_secret": "MTc0MTQ4NzY0NTI3NTE0MTc1MTQ2OTMyNTgzOTMzODI2NjYyMTY2",
      "notify_url": "http://sample.com/notify",
      "order_id": "12",
      "items": "Basic Subscription",
      "amount": "4000.00",
      "currency": "LKR",
      "first_name": "${user.firstName}",
      "last_name": "${user.lastName}",
      "email": "${user.email}",
      "phone": "",
      "address": "${user.addressLine1}",
      "city": "",
      "country": "Sri Lanka",
    };
    return paymentObject;
  }

  Future<void> subscribe() async {
    UserEntity userEntity = UserEntity(
        currentSubscription: Subscription(
      subscriptionPlanName: "Basic Subscription",
      subscriptionDuration: 30,
      startDate: DateTime.now(),
      remainingDates: 30,
    ));
    try {
      emit(SubscriptionStart());
      await subscribeUsecase.call(userEntity);
      emit(SubscriptionSuccess());
    } on SocketException catch (_) {
      emit(SubscriptionFailed());
    } catch (_) {
      emit(SubscriptionFailed());
    }
  }
}
