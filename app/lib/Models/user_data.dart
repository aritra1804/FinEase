// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserData {
  final String? firstName;
  final String? lastName;
  final String? DOB;
  final String? email;
  final String? phone;
  final String? street;
  final String? city;
  final String? state;
  final String? pincode;
  final String? governmentIdNumber;
  final String? uid;
  final String? gender;
  final String? country;
  final String? token;
  UserData({
    this.firstName,
    this.lastName,
    this.DOB,
    this.email,
    this.phone,
    this.street,
    this.city,
    this.state,
    this.pincode,
    this.governmentIdNumber,
    this.uid,
    this.gender,
    this.country,
    this.token,
  });

  UserData copyWith({
    String? firstName,
    String? lastName,
    String? DOB,
    String? email,
    String? phone,
    String? street,
    String? city,
    String? state,
    String? pincode,
    String? governmentIdNumber,
    String? uid,
    String? gender,
    String? country,
    String? token,
  }) {
    return UserData(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      DOB: DOB ?? this.DOB,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      street: street ?? this.street,
      city: city ?? this.city,
      state: state ?? this.state,
      pincode: pincode ?? this.pincode,
      governmentIdNumber: governmentIdNumber ?? this.governmentIdNumber,
      uid: uid ?? this.uid,
      gender: gender ?? this.gender,
      country: country ?? this.country,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstName': firstName,
      'lastName': lastName,
      'DOB': DOB,
      'email': email,
      'phone': phone,
      'street': street,
      'city': city,
      'state': state,
      'pincode': pincode,
      'governmentIdNumber': governmentIdNumber,
      'uid': uid,
      'gender': gender,
      'country': country,
      'token': token,
    };
  }

  factory UserData.fromMap(Map<String, dynamic> map) {
    return UserData(
      firstName: map['firstName'] != null ? map['firstName'] as String : null,
      lastName: map['lastName'] != null ? map['lastName'] as String : null,
      DOB: map['DOB'] != null ? map['DOB'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      street: map['street'] != null ? map['street'] as String : null,
      city: map['city'] != null ? map['city'] as String : null,
      state: map['state'] != null ? map['state'] as String : null,
      pincode: map['pincode'] != null ? map['pincode'] as String : null,
      governmentIdNumber: map['governmentIdNumber'] != null ? map['governmentIdNumber'] as String : null,
      uid: map['uid'] != null ? map['uid'] as String : null,
      gender: map['gender'] != null ? map['gender'] as String : null,
      country: map['country'] != null ? map['country'] as String : null,
      token: map['token'] != null ? map['token'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserData.fromJson(String source) => UserData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserData(firstName: $firstName, lastName: $lastName, DOB: $DOB, email: $email, phone: $phone, street: $street, city: $city, state: $state, pincode: $pincode, governmentIdNumber: $governmentIdNumber, uid: $uid, gender: $gender, country: $country, token: $token)';
  }

  @override
  bool operator ==(covariant UserData other) {
    if (identical(this, other)) return true;
  
    return 
      other.firstName == firstName &&
      other.lastName == lastName &&
      other.DOB == DOB &&
      other.email == email &&
      other.phone == phone &&
      other.street == street &&
      other.city == city &&
      other.state == state &&
      other.pincode == pincode &&
      other.governmentIdNumber == governmentIdNumber &&
      other.uid == uid &&
      other.gender == gender &&
      other.country == country &&
      other.token == token;
  }

  @override
  int get hashCode {
    return firstName.hashCode ^
      lastName.hashCode ^
      DOB.hashCode ^
      email.hashCode ^
      phone.hashCode ^
      street.hashCode ^
      city.hashCode ^
      state.hashCode ^
      pincode.hashCode ^
      governmentIdNumber.hashCode ^
      uid.hashCode ^
      gender.hashCode ^
      country.hashCode ^
      token.hashCode;
  }
  }
