import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

import 'package:swafa_profile/core/resources/data_state.dart';
import 'package:swafa_profile/features/data/data_source/remote/profile_api.dart';
import 'package:swafa_profile/features/data/models/profile.dart';
import 'package:swafa_profile/features/data/repository_impl/profile_repository_impl.dart';

void testGetProfile(ProfileRepositoryImpl profileRepository) async {
  final result = await profileRepository.getProfiles();

  if (result is DataSuccess<ProfileModel>) {
    final profile = result.data;
    print("Data fetched successfully:");
    print("Name: ${profile?.name}");
    print("Number of Swaps: ${profile?.numSwap}");
    print("Description: ${profile?.profileDesc}");
    print("Profile Image: ${profile?.profileImg}");
    print("Profile Storage: ${profile?.profileStorage}");
  } else if (result is DataFailed) {
    print("Data fetch failed:");
    print("Error: ${result.error}");
  } 
}

void main() {
  //Test GetProfile
  final dio = Dio();
  
  // Add logging interceptor to see what's happening
  
  dio.httpClientAdapter = IOHttpClientAdapter(
    createHttpClient: () {
      final client = HttpClient();
      client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      return client;
    }
  );

  final profileApi = ProfileApi(dio);
  final profileRepository = ProfileRepositoryImpl(profileApi);
  
  testGetProfile(profileRepository);
  
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}