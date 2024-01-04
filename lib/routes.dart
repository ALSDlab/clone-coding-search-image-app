import 'package:clone_coding_image_search_app/data/di/image_di.dart';
import 'package:clone_coding_image_search_app/ui/main_screen.dart';
import 'package:clone_coding_image_search_app/viewmodel/image_viewmodel.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

final router = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => ChangeNotifierProvider(
      create: (_) => getIt<ImageViewmodel>(),
      child: const MainScreen(),
    ),
  )
]);
