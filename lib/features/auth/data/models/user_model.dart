import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitfuel/core/common/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel(
      {final String? firstName,
      final String? lastName,
      final String? email,
      final String? uid,
      final String? dob,
      final String? status,
      final String? password,
      final String? imageUrl,
      final String? userType})
      : super(
          uid: uid,
          firstName: firstName,
          lastName: lastName,
          email: email,
          dob: dob,
          status: status,
          password: password,
          imageUrl: imageUrl,
        );

  //convert to user model from firebase document
  factory UserModel.fromSnapshot(DocumentSnapshot documentSnapshot) {
    return UserModel(
      uid: documentSnapshot.get("uid"),
      firstName: documentSnapshot.get("firstName"),
      lastName: documentSnapshot.get("lastName"),
      email: documentSnapshot.get("email"),
      dob: documentSnapshot.get("dob"),
      status: documentSnapshot.get("status"),
      imageUrl: documentSnapshot.get("imageUrl"),
    );
  }

  //convert to firebase document
  Map<String, dynamic> toDocument() {
    return {
      "status": status,
      "uid": uid,
      "dob": dob,
      "email": email,
      "imageUrl": imageUrl,
      "firstName": firstName,
      "lastName": lastName
    };
  }

  //convert from json
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      dob: json['dob'],
      status: json['status'],
      imageUrl: json['imageUrl'],
    );
  }

  //Convert to json
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'dob': dob,
      'status': status,
      'imageUrl': imageUrl,
    };
  }

  // convert to UserEntity
  UserEntity toEntity() {
    return UserEntity(
      uid: uid,
      firstName: firstName,
      lastName: lastName,
      email: email,
      dob: dob,
      status: status,
      password: password,
      imageUrl: imageUrl,
    );
  }

  //create UserModel from UserEntity
  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      uid: entity.uid,
      firstName: entity.firstName,
      lastName: entity.lastName,
      email: entity.email,
      dob: entity.dob,
      status: entity.status,
      password: entity.password,
      imageUrl: entity.imageUrl,
    );
  }

  factory UserModel.fromSnapshotImageUrl(DocumentSnapshot documentSnapshot) {
    return UserModel(
      imageUrl: documentSnapshot.get("imageUrl"),
    );
  }

  Map<String, dynamic> toDocumentImageUrl() {
    return {
      "imageUrl": imageUrl,
    };
  }
}
