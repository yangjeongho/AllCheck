import 'package:flutter/material.dart';

class TodoList {

  // /// private으로 선언된 장바구니의 상태
  // final List<Item> _items = [];
  //
  // /// 장바구니에서 목록뷰를 수정할 수 없게 합니다.
  // UnmodifiableListView<Item> get items => UnmodifiableListView(_items);
  //
  // /// 모든 항목들의 현재 합산가격 (모든 항목의 가격이 1$라고 가정합니다.)
  // int get totalPrice => _items.length;
  //
  // /// 장바구니에 항목을 추가합니다. 이것이 외부에서 장바구니를 수정할 수 있는 유일한 방법입니다.
  // void add(Item item) {
  //   _items.add(item);
  //   // 이 호출은 Model에게 위젯들이 리빌드 되어야 한다고 말해줍니다.
  //   notifyListeners();
  // }

  TodoList({
    this.isAssetsImage = false,
    this.labelName = '',
    this.icon,
    this.imageName = '',
  });

  String labelName;
  Icon? icon;
  bool isAssetsImage;
  String imageName;
}

