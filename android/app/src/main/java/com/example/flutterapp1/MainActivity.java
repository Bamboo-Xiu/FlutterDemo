package com.example.flutterapp1;

import android.os.Bundle;

import io.flutter.app.FlutterActivity;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);

    /**
     * 方法通道 实现 Dart 层调用原生代码
     */
    new CommonMethodChannel(getFlutterView(), this);
  }
}
