class UpdateItemModel{
  String appIcon;    // App 图标
  String appName;    // App 名称
  String appSize;    // App 大小
  String appDate;    // App 更新日期
  String appDescription;    // App 更新文案
  String appVersion;    // App 版本
  // 构造函数语法糖，为属性赋值
  UpdateItemModel(this.appIcon, this.appName, this.appSize, this.appDate,
  this.appDescription, this.appVersion);
}