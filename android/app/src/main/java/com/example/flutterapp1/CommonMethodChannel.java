package com.example.flutterapp1;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;

import io.flutter.plugin.common.BinaryMessenger;    // 桥接需要导入的库
import io.flutter.plugin.common.MethodChannel;    // 桥接需要导入的库

/**
 * 常用方法通道
 */
public class CommonMethodChannel{

    public CommonMethodChannel(BinaryMessenger messenger, Context context){
        // Dart 层调用 native 代码方法，需要与 NativeMethodDemo 代码一起合用
        // 创建与调用方一样的标识符的方法通道
        MethodChannel methodChannel = new MethodChannel(messenger,"wjc/navigation");
        // 设置方法调用回调
        methodChannel.setMethodCallHandler((methodCall, result) -> {// 响应方法请求
            // Note: this method is invoked on the main thread.
            // 判断方法名是否支持
            if ("openAppStore".equalsIgnoreCase(methodCall.method)){
                // 如果有 openAppStore 标记的方法
                try{
                    Uri uri = Uri.parse("market://details?id=com.tencent.mm");
                    Intent intent = new Intent(Intent.ACTION_VIEW, uri);
                    intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                    context.startActivity(intent);
                    // 返回处理结果
                    result.success(0);
                }catch (Exception e){
                    // 打开应用市场出现异常
                    result.error("UNAVAILABLE","没有安装应用市场", null);
                }
            }else{
                // 方法名暂时不支持
                result.notImplemented();
            }
        });
    }
}