import 'package:graduation_app/core/failure/failure.dart';

abstract class DeleteBookState{}

class DeleteBookInitial extends DeleteBookState{}

class DeleteBookLoading extends DeleteBookState{}

class DeleteBookSuccess extends DeleteBookState{}

class DeleteBookFailed extends DeleteBookState{
  final Failure failure;

  DeleteBookFailed(this.failure);
}
