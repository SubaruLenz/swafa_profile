import 'package:swafa_profile/core/resources/data_state.dart';
import 'package:swafa_profile/features/domain/entities/profile.dart';

abstract class ProfileRepository {
  Future<DataState<ProfileEntity>> getProfiles();
}