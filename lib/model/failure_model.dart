import 'package:freezed_annotation/freezed_annotation.dart';
part 'failure_model.freezed.dart';
part 'failure_model.g.dart';

@freezed
class FailureModel with _$FailureModel {
 const factory FailureModel({
  String? message,
  int? code,
 }) = _FailureModel;
 factory FailureModel.fromJson(Map<String, dynamic> json) => _$FailureModelFromJson(json);
}