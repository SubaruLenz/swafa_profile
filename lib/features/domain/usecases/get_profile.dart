import 'package:swafa_profile/core/resources/data_state.dart';
import 'package:swafa_profile/core/usecase/usecase.dart';
import 'package:swafa_profile/features/domain/entities/profile.dart';
import 'package:swafa_profile/features/domain/repository/profile_repository.dart';

class GetProfileUsecase implements Usecase<DataState<ProfileEntity>, void> {
  final ProfileRepository _profileRepository;

  GetProfileUsecase(this._profileRepository);

  @override
  Future<DataState<ProfileEntity>> call({void params}) {
    return _profileRepository.getProfiles();
  }
}