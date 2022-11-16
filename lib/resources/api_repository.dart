import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:retrofit/dio.dart';

import '../models/total_result_model.dart';
import 'api_provider.dart';

class ApiRepository {
  final ApiProvider _provider = ApiProvider(Dio());
  String formattedDate = DateFormat('yyyy-MM-dd')
      .format(DateTime.now().subtract(const Duration(days: 1)));
  Future<HttpResponse<TotalResult>> getCurrentTop() async {
    return await _provider.getCurrentTop(
        "created:>$formattedDate", "stars", "desc");
  }
}
