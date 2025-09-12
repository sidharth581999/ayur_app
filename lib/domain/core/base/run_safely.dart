import 'package:ayur/application/core/utils/logger.dart';
import 'package:ayur/application/core/utils/typedefs.dart';
import 'package:ayur/domain/core/exception/custom_exception.dart';
import 'package:ayur/domain/core/failures/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class RunSafely {
  RunSafely();

  ResultFuture<T> runSafely<T>(
    Future<T> Function() action, {
    MainFailure Function(String error)? failure,
  }) async {
    try {
      return right(await action());
    } on CustomException catch (e) {
      Logger.logError('RunSafely Error : $e');
      return left(
        failure?.call(e.errMsg) ??
            MainFailure.customError(
              errorMsg: e.errMsg,
            ),
      );
    } catch (e) {
      Logger.logError('RunSafely Error : $e');
      return left(
        failure?.call(
              e.toString(),
            ) ??
            MainFailure.genericError(
              errorMsg: e.toString(),
            ),
      );
    }
  }
}
