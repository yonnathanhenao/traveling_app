import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:traveling_app/modules/app/data/data.dart';
import 'package:traveling_app/modules/app/domain/domain.dart';

import '../modules/app/ui/ui.dart';

List<SingleChildWidget> appProviders = [
  Provider<HomeRepository>(create: (_) => HomeRepositoryRemote()),
  ChangeNotifierProvider(
    create: (context) => HomeViewModel(
      homeRepository: context.read<HomeRepository>(),
    ),
  ),
];
