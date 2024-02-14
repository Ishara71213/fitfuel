import 'package:equatable/equatable.dart';
import 'package:fitfuel/core/common/domain/entities/subscription.dart';

class UserEntity extends Equatable {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? uid;
  final String? dob;
  final String? status;
  final String? password;
  final String? imageUrl;
  final String? addressLine1;
  final String? addressLine2;
  final String? gender;
  final bool isSubscribed;
  final Subscription? currentSubscription;

  const UserEntity({
    this.firstName,
    this.lastName,
    this.email,
    this.uid,
    this.dob,
    this.status,
    this.password,
    this.imageUrl,
    this.addressLine1,
    this.addressLine2,
    this.gender,
    this.isSubscribed = false,
    this.currentSubscription,
  });

  @override
  // to compair value equality of an instant
  List<Object?> get props => [
        firstName,
        lastName,
        email,
        uid,
        dob,
        status,
        password,
        imageUrl,
        addressLine1,
        addressLine2,
        gender,
        isSubscribed,
        currentSubscription,
      ];
}
