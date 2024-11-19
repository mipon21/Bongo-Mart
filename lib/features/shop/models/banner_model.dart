import 'package:cloud_firestore/cloud_firestore.dart';

class BannerModel {
  String imageUrl;
  final String name;
  final String targetScreen;
  final bool active;

  BannerModel({
    required this.imageUrl,
    required this.name,
    required this.targetScreen,
    required this.active,
  });

  // Convert the model to a JSON object
  Map<String, dynamic> toJson() {
    return {
      'ImageUrl': imageUrl,
      'Name': name,
      'TargetedScreen': targetScreen,
      'Active': active,
    };
  }

  // Convert a JSON object to a BannerModel
  factory BannerModel.fromSnapshot(DocumentSnapshot snapshot) { 
    final data = snapshot.data() as Map<String, dynamic>;
    return BannerModel(
      imageUrl: data['ImageUrl'] ?? '',
      name: data['Name'] ?? '',
      targetScreen: data['TargetedScreen'] ?? '',
      active: data['Active'] ?? false,
    );
  }
}
