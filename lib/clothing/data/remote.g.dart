// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UrlDto _$UrlDtoFromJson(Map json) {
  return UrlDto(
    json['url'] as String,
  );
}

Map<String, dynamic> _$UrlDtoToJson(UrlDto instance) => <String, dynamic>{
      'url': instance.url,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ClothingRestClient implements ClothingRestClient {
  _ClothingRestClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'http://84.201.135.199:8098/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<Clothing> parseLamodaClothing(url) async {
    ArgumentError.checkNotNull(url, 'url');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'url': url};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/clothing/parse',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Clothing.fromJson(_result.data);
    return value;
  }

  @override
  Future<UrlDto> uploadImageViaFile(image) async {
    ArgumentError.checkNotNull(image, 'image');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = FormData();
    _data.files.add(MapEntry(
        'image',
        MultipartFile.fromFileSync(image.path,
            filename: image.path.split(Platform.pathSeparator).last)));
    final _result = await _dio.request<Map<String, dynamic>>(
        '/upload_image_via_file',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = UrlDto.fromJson(_result.data);
    return value;
  }

  @override
  Future<UrlDto> uploadImageViaLink(dto) async {
    ArgumentError.checkNotNull(dto, 'dto');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(dto?.toJson() ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>(
        '/upload_image_via_link',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = UrlDto.fromJson(_result.data);
    return value;
  }

  @override
  Future<Clothing> createClothing(
      title, type, color, imageUrls, imageFiles) async {
    ArgumentError.checkNotNull(title, 'title');
    ArgumentError.checkNotNull(type, 'type');
    ArgumentError.checkNotNull(color, 'color');
    ArgumentError.checkNotNull(imageUrls, 'imageUrls');
    ArgumentError.checkNotNull(imageFiles, 'imageFiles');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = FormData();
    if (title != null) {
      _data.fields.add(MapEntry('title', title));
    }
    if (type != null) {
      _data.fields.add(MapEntry('type', type));
    }
    if (color != null) {
      _data.fields.add(MapEntry('color', color));
    }
    imageUrls?.forEach((i) {
      _data.fields.add(MapEntry('imageUrls', i));
    });
    _data.files.addAll(imageFiles?.map((i) => MapEntry(
        'imageFiles',
        MultipartFile.fromFileSync(
          i.path,
          filename: i.path.split(Platform.pathSeparator).last,
        ))));
    final _result = await _dio.request<Map<String, dynamic>>('/clothing/create',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Clothing.fromJson(_result.data);
    return value;
  }

  @override
  Future<Clothing> updateClothing(
      id, title, type, color, imageUrls, imageFiles) async {
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(title, 'title');
    ArgumentError.checkNotNull(type, 'type');
    ArgumentError.checkNotNull(color, 'color');
    ArgumentError.checkNotNull(imageUrls, 'imageUrls');
    ArgumentError.checkNotNull(imageFiles, 'imageFiles');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = FormData();
    if (id != null) {
      _data.fields.add(MapEntry('id', id.toString()));
    }
    if (title != null) {
      _data.fields.add(MapEntry('title', title));
    }
    if (type != null) {
      _data.fields.add(MapEntry('type', type));
    }
    if (color != null) {
      _data.fields.add(MapEntry('color', color));
    }
    imageUrls?.forEach((i) {
      _data.fields.add(MapEntry('imageUrls', i));
    });
    _data.files.addAll(imageFiles?.map((i) => MapEntry(
        'imageFiles',
        MultipartFile.fromFileSync(
          i.path,
          filename: i.path.split(Platform.pathSeparator).last,
        ))));
    final _result = await _dio.request<Map<String, dynamic>>('/clothing/create',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Clothing.fromJson(_result.data);
    return value;
  }
}
