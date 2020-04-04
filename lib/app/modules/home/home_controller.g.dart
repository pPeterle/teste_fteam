// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$pageAtom = Atom(name: '_HomeControllerBase.page');

  @override
  int get page {
    _$pageAtom.context.enforceReadPolicy(_$pageAtom);
    _$pageAtom.reportObserved();
    return super.page;
  }

  @override
  set page(int value) {
    _$pageAtom.context.conditionallyRunInAction(() {
      super.page = value;
      _$pageAtom.reportChanged();
    }, _$pageAtom, name: '${_$pageAtom.name}_set');
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  void setPage(int newPage) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.setPage(newPage);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'page: ${page.toString()}';
    return '{$string}';
  }
}
