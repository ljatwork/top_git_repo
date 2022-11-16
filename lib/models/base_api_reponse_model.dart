abstract class BaseApiResponseModel<T> {
  T fromJson(Map<String, dynamic> json);
}
