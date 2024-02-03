import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? uid;
  final String? dob;
  final String? status;
  final String? password;
  final String? imageUrl;

  const UserEntity({
    this.firstName,
    this.lastName,
    this.email,
    this.uid,
    this.dob,
    this.status,
    this.password,
    this.imageUrl,
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
      ];
}
