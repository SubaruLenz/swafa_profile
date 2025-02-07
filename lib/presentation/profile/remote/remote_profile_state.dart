import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:swafa_profile/features/domain/entities/profile.dart';

abstract class RemoteProfileState extends Equatable {
  final ProfileEntity ? profile;
  final DioException ? error;

  const RemoteProfileState({this.profile, this.error});

  @override
  List<Object?> get props => [profile, error];
}

class RemoteProfileLoading extends RemoteProfileState {
  const RemoteProfileLoading();
}

class RemoteProfileSuccess extends RemoteProfileState {
  const RemoteProfileSuccess(ProfileEntity profile) : super(profile: profile);
}

class RemoteProfileFailed extends RemoteProfileState {
  const RemoteProfileFailed(DioException error) : super(error: error);
}