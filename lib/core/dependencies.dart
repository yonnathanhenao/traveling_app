import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:traveling_app/modules/app/data/data.dart';
import 'package:traveling_app/modules/app/domain/domain.dart';
import 'package:traveling_app/modules/auth/data/data.dart';
import 'package:traveling_app/modules/auth/domain/domain.dart';
import 'package:traveling_app/modules/auth/ui/ui.dart';

import '../modules/app/ui/ui.dart';

List<SingleChildWidget> appProviders = [
  Provider<HomeRepository>(create: (_) => HomeRepositoryRemote()),
  Provider<AuthRepository>(create: (_) => AuthRepositoryRemote()),
  Provider<LoginUseCase>(
      create: (context) => LoginUseCase(context.read<AuthRepository>())),
  ChangeNotifierProvider(
    create: (context) => HomeViewModel(
      homeRepository: context.read<HomeRepository>(),
    ),
  ),
  ChangeNotifierProvider(
    create: (context) => LoginViewModel(
      loginUseCase: context.read<LoginUseCase>(),
    ),
  ),
];
