import "dart:typed_data";
import "dart:ui";

/// TapiocaBall is a effect to apply to the video.
abstract class TapiocaBall {
  /// Creates a object to apply color filter from [Filters].
  static TapiocaBall filter(Filters filter, double degree) {
    return _Filter(filter, degree);
  }

  /// Creates a object to apply color filter from [Color].
  static TapiocaBall filterFromColor(Color color, double degree) {
    return _Filter.color(color, degree);
  }

  /// Creates a object to overlay text.
  static TapiocaBall textOverlay(
      String text, int x, int y, int size, Color color) {
    return _TextOverlay(text, x, y, size, color);
  }

  /// Creates a object to overlay a image.
  static TapiocaBall imageOverlay(Uint8List bitmap, int x, int y) {
    return _ImageOverlay(bitmap, x, y);
  }

  /// Returns a [Map<String, dynamic>] representation of this object.
  Map<String, dynamic> toMap();

  /// Returns a TapiocaBall type name.
  String toTypeName();
}

/// Enum that specifies the color filter type.
enum Filters {
  transparent,
  pink,
  white,
  blue,
  violet,
  golden,
  orange,
  cyan,
  red,
  green,
  brown
}

class _Filter extends TapiocaBall {
  late String color;
  late double degree;
  _Filter(Filters type, double degree) {
    switch (type) {
      case Filters.transparent:
        this.color = "#fcfcfc";
        break;
      case Filters.pink:
        this.color = "#ffc0cb";
        break;
      case Filters.white:
        this.color = "#ffffff";
        break;
      case Filters.blue:
        this.color = "#1f8eed";
        break;
      case Filters.violet:
        this.color = "#ffc0fa";
        break;
      case Filters.orange:
        this.color = "#ffd5c0";
        break;
      case Filters.cyan:
        this.color = "#c0ffff";
        break;
      case Filters.golden:
        this.color = "#feffc0";
        break;
      case Filters.brown:
        this.color = "#5c3e13";
        break;
      case Filters.red:
        this.color = "#ff969f";
        break;
      case Filters.green:
        this.color = "#c6fac5";
        break;
    }
    this.degree = degree;
  }
  _Filter.color(Color colorInstance, double degree) {
    this.color = '#${colorInstance.value.toRadixString(16).substring(2)}';
    this.degree = degree;
  }

  Map<String, dynamic> toMap() {
    return {'type': color, 'degree': degree};
  }

  String toTypeName() {
    return 'Filter';
  }
}

class _TextOverlay extends TapiocaBall {
  final String text;
  final int x;
  final int y;
  final int size;
  final Color color;
  _TextOverlay(this.text, this.x, this.y, this.size, this.color);

  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'x': x,
      'y': y,
      'size': size,
      'color': '#${color.value.toRadixString(16).substring(2)}'
    };
  }

  String toTypeName() {
    return 'TextOverlay';
  }
}

class _ImageOverlay extends TapiocaBall {
  final Uint8List bitmap;
  final int x;
  final int y;
  _ImageOverlay(this.bitmap, this.x, this.y);

  Map<String, dynamic> toMap() {
    return {'bitmap': bitmap, 'x': x, 'y': y};
  }

  String toTypeName() {
    return 'ImageOverlay';
  }
}
