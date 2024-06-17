import 'package:json_annotation/json_annotation.dart';
part 'payment_departments.g.dart';
@JsonSerializable()
class PaymentDepartments{
  double amount;
  DateTime date;
  String servicesName;
  String servicesAccount;
  String toCard;

  PaymentDepartments({
    required this.amount,
    required this.date,
    required this.servicesName,
    required this.servicesAccount,
    required this.toCard
});

  factory PaymentDepartments.fromJson(Map<String, dynamic> json) {
    return _$PaymentDepartmentsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$PaymentDepartmentsToJson(this);
  }
}