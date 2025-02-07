import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swafa_profile/core/resources/data_state.dart';
import 'package:swafa_profile/features/domain/usecases/get_profile.dart';
import 'package:swafa_profile/presentation/profile/remote/remote_profile_event.dart';
import 'package:swafa_profile/presentation/profile/remote/remote_profile_state.dart';

class RemoteProfileBloc extends Bloc<GetProfile, RemoteProfileState> {
  final GetProfileUsecase _getProfileUsecase;

  RemoteProfileBloc(this._getProfileUsecase) : super(const RemoteProfileLoading()) {
    on<GetProfile>(_onGetProfile);
  }

  void _onGetProfile(GetProfile event, Emitter<RemoteProfileState> emit) async {
    emit(const RemoteProfileLoading());

    final datastate = await _getProfileUsecase();

    if(datastate is DataSuccess && datastate.data != null) {
      emit(RemoteProfileSuccess(datastate.data!));
    }

    if(datastate is DataFailed) {
      emit(RemoteProfileFailed(datastate.error!));
    }
  }
}