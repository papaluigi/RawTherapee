# RawTherapee 4.0.9 for MacOS Unofficial Bundle #

![RawTherapee 4.0.9 for MacOS](https://lh6.googleusercontent.com/-XOgIMjjl2bY/UEUFkOOMw-I/AAAAAAAAIZ8/1eVSEMEjfII/w852/RawTherapee%25204.0.9.122.png)

ここでは RawTherapee 4.0.9 for MacOS のビルドテストなどをしています。開発は mattintosh4 が個人で行なっています。動作確認、バグ情報などいただけると助かります。

-	開発記録：[http://mattintosh.blog.so-net.ne.jp/archive/c2303145195-1](http://mattintosh.blog.so-net.ne.jp/archive/c2303145195-1)
-	Twitter：[@mattintosh4](https://twitter.com/mattintosh4)

ビルドしたバンドルは「非公式版」として配布していますのでご自由にお使い下さい（ただし無保証です）。非公式版の AboutThisBuild.txt には公式版と判別しやすくするために以下の表記が入っています。

```no-highlight:AboutThisBuild.txt
***** Unofficial Bundle for MacOS *****

Bundle created by mattintosh4
https://github.com/mattintosh4/RawTherapee

Thanks to all developers.
```

## RawTherapee（ロウ・セラピー）とは？ ##

RawTherapee は Windows、MacOS、Linux に対応した強力な 64-bit オープンソース RAW コンバーターです。現在、GNU GPL ライセンス下でソースコードが公開されています。英語はもちろんのこと、日本語にも対応しています。

RawTherapee 公式サイト

-	[http://rawtherapee.com/](http://rawtherapee.com/)
-	[http://code.google.com/p/rawtherapee/](http://code.google.com/p/rawtherapee/)

## 64bit バンドルに関する重要なお知らせ ##

現行版の 64bit ライブラリは __Google 日本語入力 および MacUIM と相性が悪く、キー操作を行った際に暫く操作を受け付けなくなるバグがあります__。64bit バンドルを使用する場合は起動前に IME を __Google 日本語入力、MacUIM 以外__に変更して下さい（ことえりは動作確認済みですが日本語入力は受け付けません）。起動中に IM を変更するとアプリケーションがシャットダウンする可能性もありますのでお使いの IM で一度テストすることをおすすめします。

エラー内容についてはバンドル内の `start` から起動すると確認出来ます。

```bash
open /Applications/RawTherapee.app/Contents/MacOS/start
```

以下のメッセージが出た場合は一定時間操作が無効になります。

```
(rawtherapee:582): GLib-CRITICAL **: g_hash_table_lookup: assertion `hash_table != NULL' failed
(rawtherapee:582): GLib-CRITICAL **: g_hash_table_insert_internal: assertion `hash_table != NULL' failed
```

## 更新履歴 ##

### 2012.9.5 ###

__[RawTherapee 4.0.9.123 (Denoise branch)](https://github.com/mattintosh4/RawTherapee/downloads)__ をアップしました。64bit の UIM 問題が解決していないので 32bit 版も置いてあります。公式の [issue #1546](http://code.google.com/p/rawtherapee/issues/detail?id=1546#c3) で natureh.510 さんがパッチを提供して下さいました（Thanks natureh.510)。

```no-highlight:AboutThisBuild.txt
Branch: denoise
Version: 4.0.9.123
Changeset: 65ecb9acc978
Compiler: gcc-mp-4 4.7.1
Processor: generic x86
System: Apple
Bit depth: 64 bits
Gtkmm: V2.24.2
Build type: Release (Development)
Build flags:  -mtune=generic -fopenmp -O3 -DNDEBUG
Link flags:   -mtune=generic
OpenMP support: ON
MMAP support: ON
```

### 2012.9.4 ###

__[RawTherapee 4.0.9.122 64bit](https://github.com/mattintosh4/RawTherapee/downloads)__ をアップしました。ビルド時のインクルード設定を修正しています。また、`BUILD_TYPE=Release` を基本に一部のコンパイルオプションを変更したためビルドタイプの表記を「Release (_Development_)」に変更しました。

```no-highlight:AboutThisBuild.txt
Branch: default
Version: 4.0.9.122
Changeset: c3a84087d867
Compiler: gcc-mp-4 4.7.1
Processor: generic x86
System: Apple
Bit depth: 64 bits
Gtkmm: V2.24.2
Build type: Release (Development)
Build flags:  -mtune=generic -fopenmp -O3 -DNDEBUG
Link flags:   -mtune=generic
OpenMP support: ON
MMAP support: ON
```

### 2012.8.29 ###

RawTherapee 4.0.9.118 Universal (32/64bit) をアップしました。`OSX_DEPLOYMENT_TARGET=10.5` を指定しているので 10.5 でも起動出来るかもしれません。

（※後で調べましたが 10.5 でも 64bit アプリケーションは起動出来るみたいなので不要かもしれません）

### 2012.8.28 ###

-	一部のアイコンが表示されない問題を修正しました。［[不正な MIME タイプ問題](http://mattintosh.blog.so-net.ne.jp/2012-08-29)］
-	AboutThisBuild.txt に「非公式」の表記を追加しました。
-	バンドル用改造パッチを更新しました。

### 2012.8.26 ###

-	起動スクリプトを修正し、Pango モジュールのエラーを解消しました。［[pango.modules の @executable_path の問題](http://mattintosh.blog.so-net.ne.jp/2012-08-26)］
-	info.plist の内容が古かったので更新しました。
-	以下のバンドル用改造パッチをアップしました。
	-	start.path
	-	make-app-bundle.patch
	-	info.plist.patch

### 2012.8.24 ###

公式の指針に則り、最適化対象 CPU を Generic x86 に統一しました。

### 2012.7.25 ###

初版。