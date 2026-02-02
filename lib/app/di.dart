import 'package:tut_app/app/app_imports.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  // NetworkInfo
  instance.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(InternetConnectionChecker.createInstance()),
  );

  //shared preference
  final sharedPrefs = await SharedPreferences.getInstance();
  
  instance.registerLazySingleton<AppPreferences>(()=>AppPreferences(sharedPrefs));


  // Dio Factory
  instance.registerLazySingleton<DioFactory>(() => DioFactory());

  // App Service Client
  var dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  // Remote Data Source
  instance.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(instance()),
  );

  // Repository
  instance.registerLazySingleton<Repository>(
    () => RepositoryImpl(instance(), instance()),
  );
}

void initLoginModule() {
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
    instance.registerFactory<LoginViewModel>(() => LoginViewModel(instance()));
  }
}

void initRegisterModule(){
  //todo implement the following register code
  if(GetIt.I.isRegistered()){
    instance.registerFactory<RegisterViewModel>(()=>RegisterViewModel());
  }
}