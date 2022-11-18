import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

import '../../models/total_result_model.dart';

part 'api_provider.g.dart';

@RestApi(baseUrl: '')
abstract class ApiProvider {
  factory ApiProvider(Dio dio, {String baseUrl}) = _ApiProvider;

  @GET("/repositories")
  Future<HttpResponse<TotalResult>> getCurrentTop(
    @Query("q") String query,
    @Query("sort") String sort,
    @Query("order") String order,
    @Query("page") int page,
  );
}
