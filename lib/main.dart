import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:printing_costs_2/constants.dart';
import 'package:printing_costs_2/core/utils/api_service.dart';
import 'package:printing_costs_2/core/utils/app_router.dart';
import 'package:printing_costs_2/core/utils/simple_bloc_observer.dart';
import 'package:printing_costs_2/features/finance/data/data_sources/finance_local_data_source.dart';
import 'package:printing_costs_2/features/finance/data/data_sources/finance_remote_data_source.dart';
import 'package:printing_costs_2/features/finance/data/models/finance_model.dart';
import 'package:printing_costs_2/features/finance/data/repos/finance_repo_impl.dart';
import 'package:printing_costs_2/features/finance/domain/use_cases/fetch_finance_use_case.dart';
import 'package:printing_costs_2/features/finance/presentation/manager/finance_cubit/finance_cubit.dart';
import 'package:printing_costs_2/features/finance/presentation/views/finance_view.dart';
import 'package:printing_costs_2/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:printing_costs_2/features/home/data/repos/home_repo_impl.dart';
import 'package:printing_costs_2/features/home/domain/use_case/fetch_home_use_case.dart';
import 'package:printing_costs_2/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:printing_costs_2/features/home/presentation/views/home_view.dart';
import 'package:printing_costs_2/features/login/data/data_source/login_local_data_source.dart';
import 'package:printing_costs_2/features/login/data/data_source/login_remote_data_source.dart';
import 'package:printing_costs_2/features/login/data/models/login_model.dart';
import 'package:printing_costs_2/features/login/data/repos/login_repo_impl.dart';
import 'package:printing_costs_2/features/login/domain/use_case/fetch_login_use_case.dart';
import 'package:printing_costs_2/features/login/presentation/manager/login_cubit/login_cubit.dart';
import 'package:printing_costs_2/features/login/presentation/views/login_screen.dart';
import 'package:printing_costs_2/features/materials/data/data_sources/material_local_data_source.dart';
import 'package:printing_costs_2/features/materials/data/models/material_model.dart';
import 'package:printing_costs_2/features/materials/data/models/user_material_model.dart';
import 'package:printing_costs_2/features/materials/presentation/manager/material_cubit/material_cubit.dart';
import 'package:printing_costs_2/features/materials/presentation/manager/material_cubit/user_material_cubit.dart';
import 'package:printing_costs_2/features/materials/presentation/views/material_view.dart';
import 'package:printing_costs_2/features/other/data/data_sources/other_local_data_source.dart';
import 'package:printing_costs_2/features/other/data/models/other_model.dart';
import 'package:printing_costs_2/features/other/data/repos/other_repo_impl.dart';
import 'package:printing_costs_2/features/other/domain/use_case/fetch_other_use_case.dart';
import 'package:printing_costs_2/features/other/presentation/manager/other_cubit/other_cubit.dart';
import 'package:printing_costs_2/features/other/presentation/views/other_view.dart';
import 'package:printing_costs_2/features/printers/data/data_sources/printer_local_data_source.dart';
import 'package:printing_costs_2/features/printers/data/model/printer_model.dart';
import 'package:printing_costs_2/features/printers/data/model/user_printer_model.dart';
import 'package:printing_costs_2/features/printers/presentation/manager/printer_cubit/printer_cubit.dart';
import 'package:printing_costs_2/features/printers/presentation/manager/printer_cubit/user_printer_cubit.dart';
import 'package:printing_costs_2/features/printers/presentation/views/printers_view.dart';
import 'package:printing_costs_2/features/setting/pesentations/views/setting_view.dart';
import 'package:printing_costs_2/splash_screen.dart';
import 'package:printing_costs_2/srevices/repository.dart';

import 'features/materials/data/data_sources/material_remote_data_source.dart';
import 'features/materials/data/repos/material_repo_impl.dart';
import 'features/materials/domain/use_cases/fetch_material_use_case.dart';
import 'features/other/data/data_sources/other_remote_data_source.dart';
import 'features/printers/data/data_sources/printer_remote_data_source.dart';
import 'features/printers/data/repos/printers_repo_impl.dart';
import 'features/printers/domain/use_cases/fetch_printer_use_case.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(FinanceAdapter());
  Hive.registerAdapter(MaterialsAdapter());
  Hive.registerAdapter(OtherAdapter());
  Hive.registerAdapter(PrintersAdapter());
  Hive.registerAdapter(LoginAdapter());
  Hive.registerAdapter(UserPrintersAdapter());
  Hive.registerAdapter(UserMaterialsAdapter());

  await Hive.openBox<Finance>(kFinanceBox);
  await Hive.openBox<Materials>(kMaterialBox);
  await Hive.openBox<Other>(kOtherBox);
  await Hive.openBox<Printers>(kPrinterBox);
  await Hive.openBox<Login>(kLoginBox);
  await Hive.openBox<UserPrinters>(kUserPrinterBox);
  await Hive.openBox<UserMaterials>(kUserMaterialBox);

  runApp(const MyApp());
  getIt.registerSingleton<ApiService>(
    ApiService(Dio()),
  );
  Bloc.observer = SimpleBlocObserver();
}

final getIt = GetIt.instance;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Repository repository = Repository();
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) {
          return FinanceCubit(
            FetchFinanceUseCase(
              FinanceRepoImpl(
                financeRemoteDataSource: FinanceRemoteDataSourceImpl(
                  getIt.get<ApiService>(),
                ),
                financeLocalDataSource: FinanceLocalDataSourceImpl(),
              ),
            ),
          );
        }),
        BlocProvider(create: (context) {
          return OtherCubit(
            FetchOtherUseCase(
              OtherRepoImpl(
                otherRemoteDataSource: OtherRemoteDataSourceImpl(
                  getIt.get<ApiService>(),
                ),
                otherLocalDataSource: OtherLocalDataSourceImpl(),
              ),
            ),
          );
        }),
        BlocProvider(create: (context) {
          return MaterialsCubit(
            FetchMaterialUseCase(
              MaterialRepoImpl(
                materialRemoteDataSource: MaterialRemoteDataSourceImpl(
                  getIt.get<ApiService>(),
                ),
                materialLocalDataSource: MaterialLocalDataSourceImpl(),
              ),
            ),
            FetchUserMaterialUseCase(
              MaterialRepoImpl(
                materialRemoteDataSource: MaterialRemoteDataSourceImpl(
                  getIt.get<ApiService>(),
                ),
                materialLocalDataSource: MaterialLocalDataSourceImpl(),
              ),
            ),
          );
        }),
        BlocProvider(create: (context) {
          return PrintersCubit(
            FetchPrintersUseCase(
              PrintersRepoImpl(
                printersRemoteDataSource: PrintersRemoteDataSourceImpl(
                  getIt.get<ApiService>(),
                ),
                printersLocalDataSource: PrintersLocalDataSourceImpl(),
              ),
            ),
            FetchUserPrintersUseCase(
              PrintersRepoImpl(
                printersRemoteDataSource: PrintersRemoteDataSourceImpl(
                  getIt.get<ApiService>(),
                ),
                printersLocalDataSource: PrintersLocalDataSourceImpl(),
              ),
            ),
          );
        }),
        BlocProvider(create: (context) {
          return LoginCubit(
            FetchLoginUseCase(
              LoginRepoImpl(
                loginRemoteDataSource: LoginRemoteDataSourceImpl(
                  getIt.get<ApiService>(),
                ),
                loginLocalDataSource: LoginLocalDataSourceImpl(),
              ),
            ),
          );
        }),
        BlocProvider(create: (context) {
          return MaterialsUserCubit(
            FetchMaterialUseCase(
              MaterialRepoImpl(
                materialRemoteDataSource: MaterialRemoteDataSourceImpl(
                  getIt.get<ApiService>(),
                ),
                materialLocalDataSource: MaterialLocalDataSourceImpl(),
              ),
            ),
            FetchUserMaterialUseCase(
              MaterialRepoImpl(
                materialRemoteDataSource: MaterialRemoteDataSourceImpl(
                  getIt.get<ApiService>(),
                ),
                materialLocalDataSource: MaterialLocalDataSourceImpl(),
              ),
            ),
          );
        }),
        BlocProvider(create: (context) {
          return PrintersUserCubit(
            FetchPrintersUseCase(
              PrintersRepoImpl(
                printersRemoteDataSource: PrintersRemoteDataSourceImpl(
                  getIt.get<ApiService>(),
                ),
                printersLocalDataSource: PrintersLocalDataSourceImpl(),
              ),
            ),
            FetchUserPrintersUseCase(
              PrintersRepoImpl(
                printersRemoteDataSource: PrintersRemoteDataSourceImpl(
                  getIt.get<ApiService>(),
                ),
                printersLocalDataSource: PrintersLocalDataSourceImpl(),
              ),
            ),
          );
        }),
        BlocProvider(create: (context) {
          return HomeCubit(
            FetchHomeUseCase(
              HomeRepoImpl(
                homeRemoteDataSource: HomeRemoteDataSourceImpl(
                  getIt.get<ApiService>(),
                ),
              ),
            ),

          );
        }),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        // routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          AppRouter.kSplash: (context) => SplashScreen(repository: repository),
          AppRouter.kHomeView: (context) => HomeView(repository: repository),
          AppRouter.kFinance: (context) => FinanceView(repository: repository),
          AppRouter.kMaterial: (context) =>
              MaterialView(repository: repository),
          AppRouter.kOther: (context) => OtherView(repository: repository),
          AppRouter.kPrinters: (context) =>
              PrintersView(repository: repository),
          AppRouter.kSetting: (context) => SettingView(repository: repository),
          AppRouter.kLogin: (context) => LoginScreen(repository: repository),
        },
        theme: ThemeData(
          useMaterial3: true, colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple).copyWith(background: Colors.white),
        ),
        // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
