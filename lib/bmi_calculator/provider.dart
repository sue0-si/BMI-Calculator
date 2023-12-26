import 'package:flutter/material.dart';

class ValueProvider with ChangeNotifier {
  String _height = '';
  String _weight = '';

  void setHeight(String value) {
    _height = value;
    notifyListeners();
  }

  void setWeight(String value) {
    _weight = value;
    notifyListeners();
  }

  String getHeight() {
    return _height;
  }

  String getWeight() {
    return _weight;
  }

//<editor-fold desc="Data Methods">
  ValueProvider({
    required String height,
    required String weight,
  })  : _height = height,
        _weight = weight;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ValueProvider &&
          runtimeType == other.runtimeType &&
          _height == other._height &&
          _weight == other._weight);

  @override
  int get hashCode => _height.hashCode ^ _weight.hashCode;

  @override
  String toString() {
    return 'Provider{' + ' _height: $_height,' + ' _weight: $_weight,' + '}';
  }

  ValueProvider copyWith({
    String? height,
    String? weight,
  }) {
    return ValueProvider(
      height: height ?? this._height,
      weight: weight ?? this._weight,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '_height': this._height,
      '_weight': this._weight,
    };
  }

  factory ValueProvider.fromMap(Map<String, dynamic> map) {
    return ValueProvider(
      height: map['_height'] as String,
      weight: map['_weight'] as String,
    );
  }

//</editor-fold>
}