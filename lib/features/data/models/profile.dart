import 'package:swafa_profile/features/domain/entities/profile.dart';

class ProfileModel extends ProfileEntity {
  const ProfileModel ({
    String ? name,
    int ? numSwap,
    String ? profileDesc,
    String ? profileImg,
    List<String> ? profileStorage,
  }) : super(
    name: name,
    numSwap: numSwap,
    profileDesc: profileDesc,
    profileImg: profileImg,
    profileStorage: profileStorage,
  );

  factory ProfileModel.fromJson(Map<String, dynamic> map) {
    return ProfileModel(
      name: map['name'] ?? "",
      numSwap: map['numSwap'] ?? 0,
      profileDesc: map['profileDescription'] ?? "",
      profileImg: map['profileImage'] ?? "",
      profileStorage: List<String>.from(map['profileStorage'] ?? []),
    );
  }
}