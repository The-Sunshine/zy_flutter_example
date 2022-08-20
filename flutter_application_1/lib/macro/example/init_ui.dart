
/// 格式化代码 option + command + L
/// 快速添加外层标签 option + 回车

/// Color(0xff999999)

/*
Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

])

 */

/*
Text(
          'text',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),

 */

/*
Image.asset(
            prefix_image('home.png'),
            fit: BoxFit.cover,
            width: 30,
            height: 30,
          ),

 */

/*
GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
            },
            )

 */

/*
CachedNetworkImage(
      imageUrl: imageUrl,
      fit: BoxFit.cover,
      height: height,
      width: width,
      placeholder: (ctx,url){
        return Image.asset(
          "images/placeholder.png",
          fit: BoxFit.cover,
          width: width,
          height: height,
        );
      },
      errorWidget: (ctx,url,error){
        return Image.asset(
          "images/placeholder.png",
          fit: BoxFit.cover,
          width: width,
          height: height,
        );
      }
  );
 */

/// 圆角
/*
decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(width: 0.5, color: Color(0xff999999)),
          ),

外层添加
ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container()
          ),
 */

/// 渐变
/*
decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: LinearGradient(
                  colors: [Color(0xffFFEAC5), Color(0xffE9BD6C)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
          ),

 */

/// 边框
/*
decoration: BoxDecoration(
          border: Border.all(
                  color: Colors.red,
                   width: 1,
                  ),
          ),

 */
