package com.example.flutterapp1;

import android.os.Bundle;
import io.flutter.app.FlutterActivity;
import io.flutter.plugins.GeneratedPluginRegistrant;

import io.flutter.plugin.common.MethodCall;    // 桥接需要导入的库
import io.flutter.plugin.common.MethodChannel;    // 桥接需要导入的库

import android.content.Intent;
import android.net.Uri;

public class MainActivity extends FlutterActivity {
  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);

    // Dart 层调用 native 代码方法，需要与 NativeMethodDemo 代码一起合用
    // 创建与调用方一样的标识符的方法通道
    new MethodChannel(getFlutterView(),"wjc/navigation").setMethodCallHandler(
            // 设置方法调用回调
            new MethodChannel.MethodCallHandler(){
              // 响应方法请求
              @Override
              public void onMethodCall(MethodCall call, MethodChannel.Result result){
                // Note: this method is invoked on the main thread.
                // 判断方法名是否支持
                if(call.method.equals("openAppStore")){
                  try{
                    Uri uri = Uri.parse("market://details?id=com.tencent.mm");
                    Intent intent = new Intent(Intent.ACTION_VIEW, uri);
                    intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                    startActivity(intent);
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
              }
            }
    );
  }
}
