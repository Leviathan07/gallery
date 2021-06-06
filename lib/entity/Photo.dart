import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

// Future<List<Photo>> fetchPhotos() async {
//   final response = await http.get(
//     Uri.parse('https://api.pexels.com/v1/search?query=nature&page=1&per_page=3'),
//     // Send authorization headers to the backend.
//     headers: {
//       HttpHeaders.authorizationHeader: '563492ad6f91700001000001e5c7b82186aa4c87a4c428e3cb027ea5',
//     },
//   );
//
//   // Use the compute function to run parsePhotos in a separate isolate.
//   return compute(parsePhotos, response.body);
// }
//
// // A function that converts a response body into a List<Photo>.
// List<Photo> parsePhotos(String responseBody) {
//   final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
//
//   return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
// }

class Photo {
  final String id;
  // final String width;
  // final String height;
  final String url;
  final String photographer;
  // final String photographer_url;
  // final String avg_color;
  final Source src;

  Photo({
    required this.id,
    // required this.width,
    // required this.height,
    required this.url,
    required this.photographer,
    // required this.photographer_url,
    // required this.avg_color,
    required this.src,
  });

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      id: json['id'].toString(),
      // width: json['width'] as String,
      // height: json['height'] as String,
      url: json['url'] as String,
      photographer: json['photographer'] as String,
      // photographer_url: json['photographer_url'] as String,
      // avg_color: json['avg_color'] as String,
      src: Source.fromJson(json['src']),
    );
  }
}

class Source {
  final String original;
  final String large2x;
  final String large;
  final String medium;
  final String small;
  final String portrait;
  final String landscape;

  Source({
    required this.original,
    required this.large2x,
    required this.large,
    required this.medium,
    required this.small,
    required this.portrait,
    required this.landscape,
  });

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      original: json['original'] as String,
      large2x: json['large2x'] as String,
      large: json['large'] as String,
      medium: json['medium'] as String,
      small: json['small'] as String,
      portrait: json['portrait'] as String,
      landscape: json['landscape'] as String,
    );
  }
}
