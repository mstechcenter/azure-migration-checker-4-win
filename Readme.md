# Azureマイグレーション支援ツール - Azure Migration Checker for Windows
Azure Migration Checker は [Azure にアップロードする Windows VHD または VHDX を準備する](https://learn.microsoft.com/ja-jp/azure/virtual-machines/windows/prepare-for-upload-vhd-image) に記載の内容を自動チェックするツールです。

## 条件・制約
- **<span style="color: red; ">!!!!! ツールの実行は自己責任でお願いします !!!!!</span>**
- 動作確認は Windows Server 2016 日本語版にて行っています
- 更新プログラムは最新化して動作確認を行っています
- 追加モジュールとして Pester および ExtentReports .NET CLI を使用しています

## 環境構築
- フォルダおよびファイルをそのまま任意の場所に置いてください  
- スクリプトの中で相対パスを記載していますのでフォルダおよびファイルの配置は変えないでください
### モジュールの更新
#### Pester
- 本バージョンでは Pester 5.5.0 をインクルードしています  
- 更新は [Installation and Update](https://pester.dev/docs/introduction/installation) および [パッケージの手動ダウンロード](https://learn.microsoft.com/ja-jp/powershell/gallery/how-to/working-with-packages/manual-download)を参照してファイルの再配置を行ってください

#### ExtentReports .NET CLI
- 本バージョンでは ExtentReports .NET CLI 0.0.3 をインクルードしています  
- 更新は [extent-framework / extentreports-dotnet-cli](https://github.com/extent-framework/extentreports-dotnet-cli) からダウンロードしてファイルの再配置を行ってください

## 実行手順
1. Run.ps1 を実行します
2. 自動的にテストが実行されますので少しお待ちください
3. Resultフォルダにテスト結果レポートと修正用のサンプルスクリプトが格納されます
4. サンプルスクリプトはそのまま Powershell で実行可能ですので適宜ご利用ください

## 付属ドキュメント
- Doc フォルダ下にチェック内容を記載したドキュメントを格納しています
