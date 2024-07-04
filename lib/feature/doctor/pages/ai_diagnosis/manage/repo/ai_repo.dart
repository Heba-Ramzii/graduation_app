import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:graduation_app/core/errors/failures.dart';
import 'package:graduation_app/feature/doctor/pages/ai_diagnosis/manage/models/ai_model.dart';

abstract class AiRepo {
  Future<Either<Failure, AIModel>> aiDiagnosis({
    required File image,
    required int doctorId,
  });
  Future<Either<Failure, List<AIModel>>> get();
}
