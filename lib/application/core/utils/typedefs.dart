import 'package:ayur/domain/core/failures/main_failures.dart';
import 'package:dartz/dartz.dart';


typedef Result<T> = Either<MainFailure, T>;
typedef ResultFuture<T> = Future<Result<T>>;
