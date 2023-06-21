import 'package:hive/hive.dart';

part 'company_info.g.dart';

@HiveType(typeId: 0)
class CompanyInfo extends HiveObject {
  @HiveField(0)
  String? compName;

  @HiveField(1)
  String? compSymbol;

  CompanyInfo({this.compName, this.compSymbol});
}
