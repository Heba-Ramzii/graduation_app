import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:graduation_app/core/errors/failures.dart';

abstract class AiRepo {
  Future<Either<Failure, String>> aiDiagnosis({
    required File image,
    required int doctorId,
  });
}
