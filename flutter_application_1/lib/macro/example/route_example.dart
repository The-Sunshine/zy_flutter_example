import 'package:flutter/material.dart';

/*  路由跳转+反向传值
Navigator.of(context).pushNamed("className",arguments: "参数").then(value) => print(value);

var result = await Navigator.of(context).push(MaterialPageRoute(builder: (context) {

},
settings: RouteSettings(
  arguments: "1231231",
),
maintainState: false,   // 前一页是否释放资源
fullscreenDialog: false,// false类似push，true = present
)

print(result)
)
*/

// 路由传值 上面声明了arguments
// dynamic arguments = ModalRoute.of(context).settings.arguments;

// 路由返回 
// Navigator.of(context).pop()
