# App Convention Build

## Overview

iOS、Androidアプリを一括でビルド、インストールするためのスクリプトです。

## Install

以下のコマンドが通るようにして下さい。
- xcodebuild
- python
- adb
- npm

`python-dotenv`をインストールします。

```bash
$ pip install python-dotenv
```

`ios-deploy`をインストールします。

```bash
$ npm install -g --unsafe-perm=true ios-deploy
```

## Usage

初期化を行います。

```bash
$ ./init.sh
```

スクリプト実行時に`Permission denied`と表示されたら以下のコマンドを実行して下さい。

```bash
$ chmod +x init.sh
```

`ios`, `android`ディレクトリが作成されるので、iOSのプロジェクトファイルを`ios`ディレクトリに、Androidのプロジェクトファイルを`android`ディレクトリに入れて下さい。

**for iOS**

`.ipa`ファイルを生成する時に使用する署名の設定を行います。

`config/AppIDs.csv`ファイルに`.ipa`ファイルを作成するアプリのBundleIDを入力します。

|     AppID     |
|:-------------:|
| com.hoge.app1 |
| com.hoge.app2 |
| com.hoge.app3 |

Apple Developer ProgramのAccountページからアプリをインストールするiOS端末を登録します。

登録したが完了したら、プロビジョニングプロファイルを作成します。

> Type: Ad Hoc<br>
> App ID: XC Wildcard

[Devices](https://developer.apple.com/account/resources/devices/list) / [Profiles](https://developer.apple.com/account/resources/profiles/list)

`.env`ファイルに署名をする際に使用するApple Developer Program登録したアカウントのTeam IDと、作成したプロビジョニングプロファイルを指定します。<br>
※プロビジョニングプロファイルの名前にスペースを含む場合はダブルクォーテーションで囲んでください。

プロビジョニングプロファイルをダウンロードして、Xcode上でプロビジョニングプロファイルを登録します。

### Build

アプリのビルドを行います。

iOSの.ipaファイルは`ios_output`ディレクトリに、Androidの.apkファイルは`android_output`ディレクトリにそれぞれ出力されます。

以下のコマンドを実行してビルドを行います。

```bash
# iOS / Android両方のアプリのビルド
$ ./build.sh

# iOSアプリのビルド
$ ./build_ios.sh

# Androidアプリのビルド
$ ./build_android.sh
```

### Install

アプリのインストールを行います。

iOS、AndroidデバイスをPCに接続して、アプリをインストールできる状態にして下さい。

以下のコマンドを実行してインストールを行います。

```bash
# iOS / Android両方のアプリのインストール
$ ./install.sh

# iOSアプリのインストール
$ ./install_ios.sh

# Androidアプリのインストール
$ ./install_android.sh
```

## Reference

### build

iOS

https://qiita.com/rsahara/items/024d9907af2c051f3d44

Android

https://developer.android.com/studio/build/building-cmdline?hl=ja

### install

iOS

https://qiita.com/lazyppp/items/d517e0c75d139935c772

Android

https://developer.android.com/studio/command-line/adb?hl=ja
