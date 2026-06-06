# ANXLog

基于微信 Mars xlog 的高性能跨平台日志库，支持 iOS、macOS、tvOS。

## 特性

- **高性能异步日志**：基于 Mars xlog 引擎，使用 mmap 写入，适合高并发场景
- **多平台支持**：iOS 12+、macOS 11+、tvOS 12+
- **跨平台编译**：原生支持 arm64 / x86_64，包含 device + simulator 的 xcframework
- **日志压缩**：支持 zlib 压缩
- **文件保护**：日志文件自动标记为不备份到 iCloud

## 安装

### Swift Package Manager

在 Xcode 中：`File → Add Packages → 输入仓库地址`

或在 `Package.swift` 中：

```swift
.package(url: "https://github.com/jimhuang/ANXLog.git", from: "0.1.0")
```

### CocoaPods

```ruby
pod 'ANXLog'
```

## 使用

```objc
// 初始化（通常在 App 启动时调用一次）
[ANXLogHelper setup];

// 打印日志
ANXLogInfo(@"ModuleName", @"这是一条 info 日志: %@", someObject);
ANXLogDebug(@"ModuleName", @"Debug 信息");
ANXLogWarning(@"ModuleName", @"警告信息");
ANXLogError(@"ModuleName", @"错误信息");

// 刷新缓冲区
[ANXLogHelper flush];

// 关闭（App 退出时调用）
[ANXLogHelper close];
```

## 日志级别

| 级别 | 说明 |
|------|------|
| `ANXLogLevelVerbose` | 所有日志 |
| `ANXLogLevelDebug` | 调试信息 |
| `ANXLogLevelInfo` | 一般运行时事件 |
| `ANXLogLevelWarn` | 异常但不影响运行 |
| `ANXLogLevelError` | 运行时错误 |
| `ANXLogLevelFatal` | 严重错误 |
| `ANXLogLevelNone` | 关闭所有日志 |

## 技术依赖

- Foundation
- SystemConfiguration
- resolv.9
- zlib

## 作者

jimhuang, sunsx9316@gmail.com

## License

MIT License. 详见 LICENSE 文件。
