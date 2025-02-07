import 'dart:io';

import 'package:dio/dio.dart';
import 'package:swafa_profile/core/constants/constants.dart';
import 'package:swafa_profile/core/resources/data_state.dart';
import 'package:swafa_profile/features/data/data_source/remote/profile_api.dart';
import 'package:swafa_profile/features/data/models/profile.dart';
import 'package:swafa_profile/features/domain/repository/profile_repository.dart';

class ProfileRepositoryImpl extends ProfileRepository{
  final ProfileApi _profileApi;
  ProfileRepositoryImpl(this._profileApi);

  @override
  Future<DataState<ProfileModel>> getProfiles() async {
    try {
      final httpResponse = await _profileApi.getProfiles(apiKey);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        final profiles = httpResponse.data;
        
        if (profiles.isNotEmpty) {
          return DataSuccess(profiles.first);
        } else {
          return DataFailed(
            DioException(
              error: 'No profiles found',
              requestOptions: httpResponse.response.requestOptions
            ),
          );
        }
      } else {
        return DataFailed(
          DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            requestOptions: httpResponse.response.requestOptions,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}