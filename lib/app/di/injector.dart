import 'package:dio/dio.dart';
import 'package:ejara_test_project/domain/local/local_storage.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  // // Dio client
  // injector.registerSingleton<Dio>(DioFactory(rBaseUrl).create());
  //
  // // Data - Remote
  // injector.registerSingleton<CharacterService>(CharacterService(injector()));
  // injector.registerSingleton<EpisodeService>(EpisodeService(injector()));
  // injector.registerSingleton<LocationService>(LocationService(injector()));
  //
  // // Data - Local
  //
  // // Data - Repository
  // injector.registerSingleton<CharacterRepository>(CharacterRepository(injector()));
  // injector.registerSingleton<EpisodeRepository>(EpisodeRepository(injector()));
  // injector.registerSingleton<LocationRepository>(LocationRepository(injector()));
  //
  // // Domain
  // injector.registerSingleton<GetCharacters>(GetCharacters(injector()));
  // injector.registerSingleton<GetCharacterDetail>(GetCharacterDetail(injector(), injector()));
  //
  // injector.registerSingleton<GetEpisodes>(GetEpisodes(injector()));
  // injector.registerSingleton<GetEpisodeDetail>(GetEpisodeDetail(injector(), injector()));
  //
  // injector.registerSingleton<GetLocations>(GetLocations(injector()));
  injector.registerSingleton<LocalCachedData>(LocalCachedData.instance);
  //
  // // ViewModel
  // //injector.registerFactory(() => CharactersViewModel());
  // injector.registerFactory(() => CharacterDetailViewModel());
}
