import 'package:flutter/material.dart';
import 'package:flutter_simple_treeview/flutter_simple_treeview.dart';
import 'package:get/get.dart';
import 'package:treeclass/home/ngb.dart';

class HomeController extends GetxController {
  final classificationMap = <String, Ngb>{};
  final classificationListNgb = <Ngb>[];
  int index = 0;
  String lastRead = '';
  @override
  void onInit() {
    initList2();
    super.onInit();
  }

  initList1() {
    // classificationMap.clear();
    // classificationMap.add('Acento');
    // classificationMap.add('Adjetivo');
    // classificationMap.add('Adjetivo - Simples');
    // classificationMap.add('Adjetivo - Superlativo');
    // classificationMap.add('Adjetivo - Superlativo - absoluto');
    // classificationMap.add('Adjetivo - Superlativo - absoluto - analitico');
    // classificationMap.add('Adjetivo - Superlativo - absoluto - sintetico');
    // classificationMap.add('Adjetivo - Superlativo - relativo');
    // classificationMap.add('Adjetivo - Superlativo - relativo - inferior');
    // classificationMap.add('Adjetivo - Superlativo - relativo - superior');
    // classificationMap.add('Adjetivo - Uniforme');
    // classificationMap.add('Substantivo');
    // classificationMap.add('Verbo');
  }
  initList2() {
    classificationListNgb.clear();
    classificationListNgb.add(Ngb(id: '1', title: 'Acento'));

    classificationListNgb.add(Ngb(id: '2', title: 'Adjetivo'));
    classificationListNgb.add(Ngb(id: '3', title: 'Simples', parent: '2'));

    classificationListNgb.add(Ngb(id: '4', title: 'Superlativo', parent: '2'));
    classificationListNgb.add(Ngb(id: '5', title: 'absoluto', parent: '4'));
    classificationListNgb.add(Ngb(id: '6', title: 'analitico', parent: '5'));
    // classificationListNgb.add(Ngb(id: '14', title: 'analitico2', parent: '6'));
    // classificationListNgb.add(Ngb(id: '15', title: 'analitico3', parent: '14'));
    // classificationListNgb.add(Ngb(id: '16', title: 'analitico4', parent: '15'));
    // classificationListNgb.add(Ngb(id: '17', title: 'analitico5', parent: '16'));
    classificationListNgb.add(Ngb(id: '7', title: 'sintetico', parent: '5'));
    classificationListNgb.add(Ngb(id: '8', title: 'relativo', parent: '4'));
    classificationListNgb.add(Ngb(id: '9', title: 'inferior', parent: '8'));
    classificationListNgb.add(Ngb(id: '10', title: 'superior', parent: '8'));
    classificationListNgb.add(Ngb(id: '11', title: 'Uniforme', parent: '2'));
    classificationListNgb.add(Ngb(id: '12', title: 'Substantivo'));
    classificationListNgb.add(Ngb(id: '13', title: 'Verbo'));
    print(classificationListNgb
        .where((element) => element.parent == '2')
        .toList());
  }

  // initList3() {
  //   classificationMap.clear();
  //   classificationMap.addAll({"1": Ngb(id: '1', title: 'Acento')});
  //   classificationMap.addAll({"2": Ngb(id: '2', title: 'Adjetivo')});
  //   classificationMap
  //       .addAll({"3": Ngb(id: '3', title: 'Simples', parent: '2')});
  //   classificationMap
  //       .addAll({"4": Ngb(id: '4', title: 'Superlativo', parent: '3')});
  //   classificationMap
  //       .addAll({"5": Ngb(id: '5', title: 'absoluto', parent: '4')});
  //   classificationMap
  //       .addAll({"6": Ngb(id: '6', title: 'analitico', parent: '5')});
  //   classificationMap
  //       .addAll({"7": Ngb(id: '7', title: 'sintetico', parent: '5')});
  //   classificationMap
  //       .addAll({"8": Ngb(id: '8', title: 'relativo', parent: '4')});
  //   classificationMap
  //       .addAll({"9": Ngb(id: '9', title: 'inferior', parent: '8')});
  //   classificationMap
  //       .addAll({"10": Ngb(id: '10', title: 'superior', parent: '8')});
  //   classificationMap
  //       .addAll({"11": Ngb(id: '11', title: 'Uniforme', parent: '2')});
  //   classificationMap.addAll({"12": Ngb(id: '12', title: 'Substantivo')});
  //   classificationMap.addAll({"13": Ngb(id: '13', title: 'Verbo')});
  // }
  // filter() {
  //   print('+++> filter');
  //   List<String> sub = classificationMap
  //       .where((element) => element.startsWith('Adjetivo'))
  //       .toList();
  //   print(sub.removeAt(0));
  //   print(sub);
  //   print('---> filter');
  // }

  List<TreeNode> createTree(String where) {
    print('+++> $where');
    List<TreeNode> treeNodeList = [];
    treeNodeList.clear();
    treeNodeList.add(
      childrenNodes(null),
    );

    return treeNodeList;
  }

  TreeNode childrenNodes(Ngb? ngb) {
    print(ngb == null ? '/' : ngb.title);
    List<Ngb> sub = [];
    if (ngb == null) {
      sub = classificationListNgb
          .where((element) => element.parent == null)
          .toList();
    } else {
      sub = classificationListNgb
          .where((element) => element.parent == ngb.id)
          .toList();
    }
    print(sub);
    if (sub.isNotEmpty) {
      return TreeNode(
          content: Text(ngb == null ? '/' : ngb.title),
          children: sub.map((e) => childrenNodes(e)).toList());
    }
    return TreeNode(
        content: TextButton(
      child: Text(ngb == null ? '/' : ngb.title),
      onPressed: () => print(Text(ngb == null ? '/' : ngb.title)),
    ));
    // return TreeNode(content: Text(ngb == null ? '/' : ngb.title));
  }

  // return TreeNode(
  //     content: Text(ngb == null ? '/' : ngb.title),
  //     children: sub.map((e) {
  //       return childrenNodes(ngb);
  //     }).toList());
  // TreeNode childrenNodes(String name) {
  //   // lastRead = name;
  //   print('lastRead $name');
  //   // index++;
  //   List<String> sub = classificationList
  //       .where((element) => element.startsWith(name))
  //       .toList();
  //   if (sub.isNotEmpty) {
  //     sub.removeAt(0);
  //     print(sub);
  //     //   for (var element in sub) {
  //     // }
  //     return TreeNode(
  //         content: Text(name),
  //         children: sub.map((e) {
  //           index++;
  //           return childrenNodes(e);
  //         }).toList());
  //     // children: [for (var element in sub) childrenNodes(element)]);
  //     // }
  //   } else {
  //     return TreeNode(content: Text(name));
  //   }
  // }

  // TreeNode childrenNodes(String name) {
  //   // lastRead = name;
  //   print('lastRead $name');
  //   // index++;
  //   List<String> sub = classificationList
  //       .where((element) => element.startsWith(name))
  //       .toList();
  //   // TreeNode a = TreeNode(content: Text(name));
  //   if (sub.isNotEmpty) {
  //     sub.removeAt(0);
  //     print(sub);
  //     //   for (var element in sub) {
  //     // }
  //     return TreeNode(
  //         content: Text(name),
  //         children: [for (var element in sub) childrenNodes(element)]);
  //     // }
  //   }
  //   return TreeNode(content: Text(name));
  // }

/*
  TreeNode childrenNodes(String name) {
    List<String> sub = classificationList
        .where((element) => element.startsWith(name))
        .toList();

    if (sub.isNotEmpty) {
      sub.removeAt(0);
      print(sub);
      for (var element in sub) {
        index++;
        return TreeNode(
          content: Text(name),
          children: [
            childrenNodes(element),
          ],
        );
      }
    }
    return TreeNode(content: Text(name));
  }
  */

  // List<TreeNode> createTree(String where) {
  //   print('+++> $where');
  //   List<TreeNode> treeNodeList = [];
  //   index = 0;
  //   do {
  //     print('index: $index | ${classificationList[index]}');
  //     if (classificationList[index + 1].startsWith(classificationList[index])) {
  //       print(
  //           'index: $index | ${classificationList[index + 1]} start with ${classificationList[index]}');
  //       treeNodeList.add(
  //         childrenNodes(index),
  //       );
  //     } else {
  //       treeNodeList.add(
  //         TreeNode(content: Text(classificationList[index])),
  //       );
  //     }
  //     index++;
  //   } while (index < classificationList.length - 1);
  //   print('---> $where');

  //   return treeNodeList;
  // }

  // TreeNode childrenNodes(int index) {
  //   if (classificationList[index + 1].startsWith(classificationList[index]) &&
  //       index < classificationList.length - 1) {
  //     print(
  //         'index: $index | ${classificationList[index + 1]} start with ${classificationList[index]}');
  //     return TreeNode(
  //         content: Text(classificationList[index]),
  //         children: [childrenNodes(++index)]);
  //   } else {
  //     print(
  //         'index: $index | ${classificationList[index + 1]} not start with ${classificationList[index]}');
  //   }
  //   return TreeNode(content: Text(classificationList[index]));
  // }

  // List<TreeNode> createTree(String where) {
  //   print('+++> $where');
  //   List<TreeNode> treeNodeList = [];
  //   for (var i = 0; i < classificationList.length - 1; i++) {
  //     print('index: $i | ${classificationList[i]}');
  //     if (classificationList[i + 1].startsWith(classificationList[i])) {
  //       print(
  //           'index: $i | ${classificationList[i + 1]} start with ${classificationList[i]}');
  //       treeNodeList.add(
  //         childrenNodes(i),
  //       );
  //     } else {
  //       treeNodeList.add(
  //         TreeNode(content: Text(classificationList[i])),
  //       );
  //     }
  //   }
  //   print('---> $where');

  //   return treeNodeList;
  // }

  // TreeNode childrenNodes(int index) {
  //   if (classificationList[index + 1].startsWith(classificationList[index]) &&
  //       index < classificationList.length - 1) {
  //     print(
  //         'index: $index | ${classificationList[index + 1]} start with ${classificationList[index]}');
  //     return TreeNode(
  //         content: Text(classificationList[index]),
  //         children: [childrenNodes(index + 1)]);
  //   } else {
  //     print(
  //         'index: $index | ${classificationList[index + 1]} not start with ${classificationList[index]}');
  //   }
  //   return TreeNode(content: Text(classificationList[index]));
  // }

// classTree(filename) {
//     var stats = fs.lstatSync(filename),
//         info = {
//             path: filename,
//             name: path.basename(filename)
//         };

//     if (stats.isDirectory()) {
//         info.type = "folder";
//         info.children = fs.readdirSync(filename).map(function(child) {
//             return dirTree(filename + '/' + child);
//         });
//     } else {
//         // Assuming it's a file. In real life it could be a symlink or
//         // something else!
//         info.type = "file";
//     }

//     return info;
// }

}
