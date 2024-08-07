import 'package:news/models/source_response/source.dart';

class SourceResponse {
  final String? status;
  final List<Source>? sources;

  const SourceResponse({this.status, this.sources});

  @override
  String toString() => 'SourceResponse(status: $status, sources: $sources)';

  factory SourceResponse.fromJson(Map<String, dynamic> json) {
    return SourceResponse(
      status: json['status'] as String?,
      sources: (json['sources'] as List<dynamic>?)
          ?.map((e) => Source.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
