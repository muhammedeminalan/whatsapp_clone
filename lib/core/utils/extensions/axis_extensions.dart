import 'package:flutter/material.dart';

/// -----------------------------
/// Column CrossAxis Extensions
/// -----------------------------
extension ColumnCrossAxis on Column {
  Column get crossStart => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: mainAxisAlignment,
    mainAxisSize: mainAxisSize,
    key: key,
    children: children,
  );

  Column get crossCenter => Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: mainAxisAlignment,
    mainAxisSize: mainAxisSize,
    key: key,
    children: children,
  );

  Column get crossEnd => Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    mainAxisAlignment: mainAxisAlignment,
    mainAxisSize: mainAxisSize,
    key: key,
    children: children,
  );
}

/// -----------------------------
/// Column MainAxis Extensions
/// -----------------------------
extension ColumnMainAxis on Column {
  Column get mainStart => Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: crossAxisAlignment,
    mainAxisSize: mainAxisSize,
    key: key,
    children: children,
  );

  Column get mainCenter => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: crossAxisAlignment,
    mainAxisSize: mainAxisSize,
    key: key,
    children: children,
  );

  Column get mainEnd => Column(
    mainAxisAlignment: MainAxisAlignment.end,
    crossAxisAlignment: crossAxisAlignment,
    mainAxisSize: mainAxisSize,
    key: key,
    children: children,
  );

  Column get mainSpaceBetween => Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: crossAxisAlignment,
    mainAxisSize: mainAxisSize,
    key: key,
    children: children,
  );

  Column get mainSpaceAround => Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    crossAxisAlignment: crossAxisAlignment,
    mainAxisSize: mainAxisSize,
    key: key,
    children: children,
  );

  Column get mainSpaceEvenly => Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: crossAxisAlignment,
    mainAxisSize: mainAxisSize,
    key: key,
    children: children,
  );
}

/// -----------------------------
/// Row CrossAxis Extensions
/// -----------------------------
extension RowCrossAxis on Row {
  Row get crossStart => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: mainAxisAlignment,
    mainAxisSize: mainAxisSize,
    key: key,
    children: children,
  );

  Row get crossCenter => Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: mainAxisAlignment,
    mainAxisSize: mainAxisSize,
    key: key,
    children: children,
  );

  Row get crossEnd => Row(
    crossAxisAlignment: CrossAxisAlignment.end,
    mainAxisAlignment: mainAxisAlignment,
    mainAxisSize: mainAxisSize,
    key: key,
    children: children,
  );
}

/// -----------------------------
/// Row MainAxis Extensions
/// -----------------------------
extension RowMainAxis on Row {
  Row get mainStart => Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: crossAxisAlignment,
    mainAxisSize: mainAxisSize,
    key: key,
    children: children,
  );

  Row get mainCenter => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: crossAxisAlignment,
    mainAxisSize: mainAxisSize,
    key: key,
    children: children,
  );

  Row get mainEnd => Row(
    mainAxisAlignment: MainAxisAlignment.end,
    crossAxisAlignment: crossAxisAlignment,
    mainAxisSize: mainAxisSize,
    key: key,
    children: children,
  );

  Row get mainSpaceBetween => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: crossAxisAlignment,
    mainAxisSize: mainAxisSize,
    key: key,
    children: children,
  );

  Row get mainSpaceAround => Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    crossAxisAlignment: crossAxisAlignment,
    mainAxisSize: mainAxisSize,
    key: key,
    children: children,
  );

  Row get mainSpaceEvenly => Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: crossAxisAlignment,
    mainAxisSize: mainAxisSize,
    key: key,
    children: children,
  );
}
