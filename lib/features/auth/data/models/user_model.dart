import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitfuel/core/common/domain/entities/subscription.dart';
import 'package:fitfuel/core/common/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    final String? firstName,
    final String? lastName,
    final String? email,
    final String? uid,
    final String? dob,
    final String? status,
    final String? password,
    final String? imageUrl,
    final String? addressLine1,
    final String? addressLine2,
    final String? gender,
    final bool isSubscribed = false,
    final Subscription? currentSubscription,
  }) : super(
            uid: uid,
            firstName: firstName,
            lastName: lastName,
            email: email,
            dob: dob,
            status: status,
            password: password,
            imageUrl: imageUrl,
            addressLine1: addressLine1,
            addressLine2: addressLine2,
            gender: gender,
            isSubscribed: isSubscribed,
            currentSubscription: currentSubscription);

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
      addressLine1: documentSnapshot.get("addressLine1"),
      addressLine2: documentSnapshot.get("addressLine2"),
      gender: documentSnapshot.get("gender"),
      isSubscribed: documentSnapshot.get("isSubscribed") ?? false,
      currentSubscription: documentSnapshot.get("currentSubscription") != null
          ? Subscription.fromJson(documentSnapshot.get("currentSubscription"))
          : null,
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
      "lastName": lastName,
      "addressLine1": addressLine1,
      "addressLine2": addressLine2,
      "gender": gender,
      "isSubscribed": isSubscribed,
      "currentSubscription":
          currentSubscription ?? currentSubscription!.toJson(),
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
      addressLine1: json['addressLine1'],
      addressLine2: json['addressLine2'],
      gender: json['gender'],
      isSubscribed: json['isSubscribed'] ?? false,
      currentSubscription: json['currentSubscription'] != null
          ? Subscription.fromJson(json['currentSubscription'])
          : null,
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
      'addressLine1': addressLine1,
      'addressLine2': addressLine2,
      'gender': gender,
      'isSubscribed': isSubscribed,
      'currentSubscription': currentSubscription?.toJson(),
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
      addressLine1: addressLine1,
      addressLine2: addressLine2,
      gender: gender,
      isSubscribed: isSubscribed,
      currentSubscription: currentSubscription,
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
      addressLine1: entity.addressLine1,
      addressLine2: entity.addressLine2,
      gender: entity.gender,
      isSubscribed: entity.isSubscribed,
      currentSubscription: entity.currentSubscription,
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
