# ZAdSDK iOS 使用說明文件

ZADSDK 是一款專為 iOS 開發者設計的輕量級全頁面廣告展示工具。本 SDK 採用 `xcframework` 格式封裝，並透過 Swift Package Manager (SPM) 進行分發。

## 1. 系統需求

*   **iOS 版本**: iOS 11.0 或更高版本
*   **Xcode 版本**: Xcode 15.0 或更高版本
*   **語言**: Swift 5.0+ 或 Objective-C

## 2. 安裝方式 (通用)

無論您的專案是 Swift 還是 Objective-C，安裝步驟皆相同：

1.  在 Xcode 中開啟您的專案，選擇 **File > Add Package Dependencies...**
2.  在搜尋欄中輸入 SDK 的 GitHub 倉庫網址：

    ```text
    https://github.com/balvenie-ios/ZADSDK
    ```
3.  在 **Dependency Rule** 處選擇 `Up to Next Major Version`（例如從 `1.0.0` 開始）。
4.  點擊 **Add Package**，並在 Target 列表中勾選您的 App Target。

---

## 3. Swift 專案整合指南

Swift 專案的整合非常直覺，無需額外設定。

### 步驟 1：匯入模組
在需要使用 SDK 的檔案（如 `AppDelegate.swift` 或 `ViewController.swift`）頂部加入：

```swift
import ZADSDK
```

### 步驟 2：初始化與設定 (Optional)
建議在 `AppDelegate` 中開啟除錯日誌，以便確認 SDK 運作狀態。

```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // 開啟 SDK 除錯訊息輸出 (預設為 false)
    ZAdSDK.shared.enableLogging = true
    return true
}
```

### 步驟 3：顯示廣告
在您希望顯示廣告的時機（例如按鈕點擊後）呼叫：

```swift
ZAdSDK.shared.showFullAd()
```

---

## 4. Objective-C 專案整合指南

由於本 SDK 是由 Swift 開發，若您的專案是**純 Objective-C** 專案，請務必執行 **步驟 1** 的環境設定，否則可能會發生執行期崩潰。

### 步驟 1：調整 Build Settings (關鍵)

如果您的專案中沒有任何 Swift 檔案，Xcode 可能不會自動連結 Swift 標準函式庫，且需要啟用 Modules 功能以支援 `@import`。

1.  點擊專案導航列的 **Project** 圖示。
2.  選擇您的 **Target**。
3.  進入 **Build Settings** 分頁。
4.  請確認以下三項設定（可使用搜尋欄尋找）：
    *   **Defines Module**: 設定為 **Yes**
    *   **Enable Modules (C and Objective-C)**: 設定為 **Yes**
    *   **Always Embed Swift Standard Libraries**: 設定為 **Yes**

### 步驟 2：匯入模組
本 SDK 支援 Module 匯入方式。請在 `.m` 或 `.h` 檔案頂部加入：

```objective-c
@import ZADSDK;
```

> **注意**: 如果您的專案較舊不支援 `@import`，請使用傳統匯入方式：
> `#import <ZADSDK/ZADSDK-Swift.h>` (視 Framework 打包方式而定，通常推薦使用 `@import`)

### 步驟 3：初始化與設定
在 `AppDelegate.m` 中設定日誌開關：

```objective-c
#import "AppDelegate.h"
@import ZADSDK;

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // 開啟除錯模式
    [ZAdSDK shared].enableLogging = YES;
    return YES;
}

@end
```

### 步驟 4：顯示廣告
在您的 ViewController (例如 `ViewController.m`) 中呼叫廣告：

```objective-c
#import "ViewController.h"
@import ZADSDK;

@implementation ViewController

- (IBAction)showAdButtonTapped:(id)sender {
    // 呼叫全頁面廣告
    [[ZAdSDK shared] showFullAd];
}

@end
```

---

## 5. 進階說明

### 執行緒安全
`showFullAd()` 內部已處理 UI 執行緒調度，開發者可以從任何執行緒（包括背景執行緒）安全呼叫，SDK 會自動確保廣告在主執行緒 (Main Thread) 顯示。

### 避免重複顯示
SDK 內建狀態保護機制。如果目前已有廣告正在畫面上展示，重複呼叫 `showFullAd()` 將會被自動忽略，並在日誌中提示，確保不會產生多個視窗堆疊的問題。

### 隱私與安全
*   **Privacy Manifest**: SDK 已內建 `PrivacyInfo.xcprivacy` 檔案，符合 Apple 對於第三方 SDK 的隱私揭露要求。
*   **網路通訊**: 所有通訊均符合 App Transport Security (ATS) 規範。

## 6. 常見問題 (FAQ)

**Q: ObjC 專案執行時發生 `dyld: Library not loaded: @rpath/libswiftCore.dylib` 錯誤？**

A: 請檢查 **Build Settings** 中的 **Always Embed Swift Standard Libraries** 是否已設定為 **Yes**。這是純 ObjC 專案使用 Swift Framework 最常見的問題。

**Q: 呼叫 `showFullAd` 沒反應？**



A: 請確認是否已開啟 `enableLogging` 並檢查 Console 輸出。如果廣告正在顯示中，再次呼叫會被忽略。



**Q: 編譯時出現 `Could not find or use auto-linked library 'swiftCompatibility56'` 警告？**



A: 這是因為 Xcode 在純 Objective-C 專案中未完全初始化 Swift 連結環境。

**解法**：請在您的專案中新增一個**空的 Swift 檔案**（例如 `FixSwift.swift`）。當 Xcode 詢問是否建立 Bridging Header 時，選擇 **"Don't Create"** 即可。只要專案中存在 Swift 檔案，Xcode 就會自動修正連結路徑。
