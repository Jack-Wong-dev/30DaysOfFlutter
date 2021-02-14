import 'package:day_13_block_and_cubit/post.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'post.dart';
import 'data_service.dart';

class PostsCubit extends Cubit<List<Post>> {
  final _dataService = DataService();

  PostsCubit() : super([]);

  void getPosts() async => emit(await _dataService.getPosts());
}
