import 'package:hive/hive.dart';
import 'package:stocks/models/company_info.dart';

class HiveBox {
  static Box<CompanyInfo> getCompanyInfo() =>
      Hive.box<CompanyInfo>('company_info');
}
