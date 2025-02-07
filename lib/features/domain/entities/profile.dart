import 'package:equatable/equatable.dart';

class ProfileEntity extends Equatable {
  final String ? name;
  final int ? numSwap;
  final String ? profileDesc;
  final String ? profileImg;
  final List<String> ? profileStorage;

  const ProfileEntity ({
    this.name,
    this.numSwap,
    this.profileDesc,
    this.profileImg,
    this.profileStorage,
  });

  @override
  List<Object?> get props {
    return [
      name,
      numSwap,
      profileDesc,
      profileImg,
      profileStorage
    ];
  }
}