import 'package:clone_coding_image_search_app/di/di_setup.dart';
import 'package:clone_coding_image_search_app/ui/main_screen.dart';
import 'package:clone_coding_image_search_app/ui/main_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

final router = GoRouter(routes: [
  GoRoute(path: '/',
      builder: (context, state) =>
          ChangeNotifierProvider(create: (_) => getIt<MainViewModel>(),
            child: const MainScreen(),))
]);