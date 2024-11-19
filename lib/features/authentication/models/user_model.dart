import '../../../utils/formatters/formatter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  final String username;
  final String email;
  String firstName;
  String gender;
  String lastName;
  String phoneNumber;
  String dateOfBirth;
  String profilePicture;

  UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.firstName,
    required this.gender,
    required this.lastName,
    required this.phoneNumber,
    required this.dateOfBirth,
    required this.profilePicture,
  });

  String get fullName => '$firstName $lastName';

  String get formattedPhoneNumber => TFormatter.formatPhoneNumber(phoneNumber);

  String get generatedUsernameforemailpassword => "bmx_$username";

  static List<String> nameParts(fullName) => fullName.split(" ");
  
  static String generateUsername(fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelCaseUsername =
        "$firstName$lastName"; // Combine first and last name
    String usernameWithPrefix = "bmx_$camelCaseUsername"; // Add "cwt_" prefix
    return usernameWithPrefix;
  }

  // Static function to create an empty user model.
  static UserModel empty() => UserModel(
      id: "",
      firstName: "",
      lastName: "",
      username: "",
      email: "",
      phoneNumber: "",
      dateOfBirth: "",
      gender: "",
      profilePicture: "");

  // Convert model to JSON structure for storing data in Firebase.
  Map<String, dynamic> toJson() {
    return {
      'FirstName': firstName,
      'LastName': lastName,
      'Username': username,
      'Email': email,
      //'PhoneNumber': formattedPhoneNumber,
      //'DateOfBirth': dateOfBirth,
      //'Gender': gender,
      'ProfilePicture': profilePicture,
    };
  }
  Map<String, dynamic> toJsonEmailPassword() {
    return {
      'FirstName': firstName,
      'LastName': lastName,
      'Username': generatedUsernameforemailpassword,
      'Email': email,
      'PhoneNumber': formattedPhoneNumber,
      'DateOfBirth': dateOfBirth,
      'Gender': gender,
      'ProfilePicture': profilePicture,
    };
  }

  // Factory method to create a UserModel from a Firebase document snapshot.
  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
        id: document.id,
        firstName: data['FirstName'] ?? "",
        lastName: data['LastName'] ?? "",
        username: data['Username'] ?? "",
        email: data['Email'] ?? "",
        phoneNumber: data['PhoneNumber'] ?? "",
        dateOfBirth: data['DateOfBirth'] ?? "",
        gender: data['Gender'] ?? "",
        profilePicture: data['ProfilePicture'] ?? "",
      );
    } else {
      return UserModel.empty();
    }
  }
}
