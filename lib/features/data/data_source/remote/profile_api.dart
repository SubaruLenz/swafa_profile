import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import 'package:swafa_profile/features/data/models/profile.dart';
import 'package:swafa_profile/core/constants/constants.dart';

part 'profile_api.g.dart';

@RestApi(baseUrl: apiUrl)
abstract class ProfileApi {
  factory ProfileApi(Dio dio) = _ProfileApi;

  @GET('/profile')
  Future<HttpResponse<List<ProfileModel>>> getProfiles(
    @Header(apiHeader) String api
  );
}