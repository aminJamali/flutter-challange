import 'package:dartz/dartz.dart';

import '../error_handler/error_handler_view_model.dart';


abstract class BaseUseCase<R, P> {
  Future<Either<ErrorHandlerViewModel, R>> call(final P params);
}
