import 'package:ayur/domain/core/exception/custom_exception.dart';
import 'package:ayur/domain/core/failures/value_object/value_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class ValueObjet<T> extends Equatable {
  const ValueObjet();

  Either<ValueFailure<String>, T> get value;

  bool isValid() => value.isRight();

  /// Throws [CustomException] containing the [ValueFailure]
  T getOrCrash() {
    // id = identity same as writeing (right) => right
    return value.fold(
        (l) => throw CustomException(errMsg: 'Unexpected value at $T'), id);
  }

  ValueFailure? get getFailure => value.fold(id, (r) => null);

  T? get getValue => value.fold((l) => null, id);

  @override
  List<Object> get props => [value];

  @override
  String toString() => 'Value($value)';
}


