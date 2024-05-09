import 'package:pfeprojectcar/utils/formatters/formatter.dart';

class UserModel {
  final String id;
  String firstName;
  String lastName;
  final String username;
  final String email;
  String phoneNumber;
  String profilePicture;

  //Constructor of the UserModel
  UserModel({
    required  this.id,
    required  this.firstName,
    required  this.lastName,
    required  this.username,
    required  this.email,
    required  this.phoneNumber,
    required  this.profilePicture
    });

  //Helper Function to get the full Name
  String get fullName => '$firstName $lastName';
  //Helper Function to Format Phone Number
  String get formatToPhoneNumber => TFormatter.formatPhoneNumber(phoneNumber);
  //Static Function to separate fullName into firstName and lastName
  static List<String> nameParts(fullName) => fullName.split(' ');
  //Static Function to generate username from full Name 
  static String generateUsername(fullName){
    List<String> nameParts = fullName.split(' ');
    String firstName = nameParts[0].toLowerCase() ;
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";
    String camelCaseUsername = '$firstName$lastName';
    String usernameWithPrefix = 'cwt_$camelCaseUsername';
    return usernameWithPrefix ;
  } 
  //Static Function to create an empty Model
  static UserModel empty() => UserModel(id: "", firstName: "", lastName: "", username: "", email: "", phoneNumber: "", profilePicture: "");

    Map<String, dynamic> toJson() {
    return {
    "firstName": firstName,
    "lastName": lastName,
    "username": username,
    "Email": email,
    "PhoneNumber": phoneNumber,
    "ProfilePicture": profilePicture
    } ;
  }
}