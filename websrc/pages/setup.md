---
title: 第0回 環境構築1（C#/F#共通）
date:  2022-03-24
tableOfContents: true
---

> [!CAUTION]
> [2024年8月一杯でVisual Studio for Macの提供が廃止される](https://learn.microsoft.com/en-us/visualstudio/mac/what-happened-to-vs-for-mac?view=vsmac-2022) こととなった．
> それにともない，今年はVisual Studio Code上でC# Dev KitおよびIonide for F#を用いた環境構築法を紹介することとする．Visual Studio を使いたい人は[2023年度の環境構築法](./setup_gui_2023.html)を参照されたし．

まずは，[.NET SDKのインストール](#dotnet_sdk) を行い，その後[Visual Studio Code (VSCode) のインストール・設定](#vscode)を行う．
自分の好きなエディタ（viやEmacs等）を使用したい人は後者はしなくてもよい．

なお，このページで紹介している方法ではF#演習のための環境構築にもなっている．C#演習の第5週・第6週目の課題を進めるには [さらなる準備（別ページ）](./setup_gui.html) が必要である（こちらはC#演習分のみ）．

（本ページに掲載されているスクリーンショットは，マイクロソフトの許諾を得て使用しています．）

# .NET SDKのインストール {#dotnet_sdk}

## インストール

#. [.NET SDKのダウンロードページ](https://dotnet.microsoft.com/ja-jp/download) より，software development kit (SDK)をダウンロードする．2025年度は`.NET 8.0`のものを使用することとする．
   * Windowsの人はWindows版のSDKをダウンロードする．
   * Mac版についてはいわゆるintel MacとAppleシリコン（M1やM2）のMacではダウンロードすべきものが違うので注意．前者はx64版を後者はArm64版をダウンロードしよう．

#. ダウンロードしたインストーラを実行し，指示に従ってインストールを完了する．
   - Windows版なら``dotnet-sdk-8.0.407-win-x64.exe``みたいな名前
   - Macのx64版なら``dotnet-sdk-8.0.407-osx-x64.pkg``/``dotnet-sdk-8.0.407-osx-arm64.pkg`` みたいな名前

#. ターミナル（WindowsだとPowerShellか「コマンド プロンプト」，MacだとTerminal.appやiTerm.app）を開き，以下を実行する．

   ```console
   dotnet --list-sdks
   ```

   以下は私の環境における出力だが，このようにダウンロードしたSDK（上の`8.0.407`）が表示されたらばOK．

   ```console
   6.0.400 [/usr/local/share/dotnet/sdk]
   6.0.407 [/usr/local/share/dotnet/sdk]
   6.0.408 [/usr/local/share/dotnet/sdk]
   6.0.410 [/usr/local/share/dotnet/sdk]
   6.0.419 [/usr/local/share/dotnet/sdk]
   7.0.202 [/usr/local/share/dotnet/sdk]
   7.0.302 [/usr/local/share/dotnet/sdk]
   7.0.304 [/usr/local/share/dotnet/sdk]
   7.0.313 [/usr/local/share/dotnet/sdk]
   8.0.200 [/usr/local/share/dotnet/sdk]
   8.0.407 [/usr/local/share/dotnet/sdk]
   ```

## 動作確認 {#check_dotnetsdk_install}

（動作確認は以下のVSCodeのインストール・設定後にも行うので，この時点では飛ばしてもよい）

1. 適当なフォルダに移動して以下を実行する．

   ```console
   dotnet new console -o HelloWorldCS 
   ```

1. ``HelloWorldCS`` というフォルダができているので，そこに移動する．  

   ```console
   cd HelloWorldCS 
   ```

   中身を``ls``で確認してみよう．たとえば，Macだと以下のように表示される（Windowsだと ``ls`` は ``dir`` の別名なので，表示は多少異なる）． 

   ```console
   HelloWorldCS.csproj  Program.cs           obj/
   ```

   プログラムを書くには ``Program.cs`` を変更すればよい．現時点では ``Program.cs`` の中身は以下の通りである（``cat Program.cs``を実行するなどすると見られる）．

   ```cs
   // See https://aka.ms/new-console-template for more information
   Console.WriteLine("Hello, World!");
   ```

1. 以下のコマンドを実行してビルドする．

   ```console
   dotnet build
   ```

1. 以下を実行してビルドしたプログラムを実行する． 

   ```console
   dotnet run 
   ```

   すると，``"Hello, World!"``が表示されるのが確認できるはずだ． 

1. F#でも同様であることを確認しておこう（``dotnet new``を実行する場面で，``dotnet new console -o HelloWorldCS`` の代わりに ``dotnet new console -lang "F#" -o HelloWorldFS`` とする．また，このコマンドだと``HelloWorldCS``ではなく``HelloWorldFS``というフォルダが作成される）

# Visual Studio Code (VSCode) のインストール・設定 {#vscode}

## インストール・設定

1. <https://code.visualstudio.com/> からインストーラをダウンロードする．

1. ダウンロードしたインストーラを実行し，指示に従いインストールする．

1. お好みで[Japanese Language Pack for Visual Studio Code](https://marketplace.visualstudio.com/items?itemName=MS-CEINTL.vscode-language-pack-ja>)をインストールし，UIを日本語にする．


   リンク先のウェブページの「Install」ボタンを押すと，「VSCodeで開きますか」旨の質問が表示されるのでそうする旨の選択する．
   すると，VSCode内で当該拡張機能のページが表示されるので，そこの"Install"ボタンを選択する．

   !["Install"ボタンは当該拡張機能のページの上部にある](images/vscode/vscode_extension_j.png)

   あるいは， VSCode上で拡張機能の検索画面からインストールする．
   左下の歯車アイコンをクリックし"Extensions"を選択する，かWindowsだとControl + Shift + X，MacだとCommand + Shift + Xを押す．
   するとサイドバーが"EXTENSIONS"に切り替わる．サイドバー上部の検索欄から"Japanese"で検索すると"Japanese Language Pack for Visual Studio Code"が検索結果に現れると思うのでその"install"をクリックする．

   > [!NOTE]
   > 一番左のアイコンが並んでいる部分はアクティビティバーであってサイドバーではない．上のスクリーンショットでは表示されていないが，サイドバーはその隣の領域である．

   しばらくするとインストールが完了し，VSCodeの再起動が求められるので指示に従う．

1. [C# Dev Kit](https://marketplace.visualstudio.com/items?itemName=ms-dotnettools.csdevkit) をインストールする．
   上と同様にリンク先のウェブページからインストールするか，左下の歯車アイコンをクリックし「拡張機能」を選択し，
   拡張機能サイドバーより検索してインストールする（"C#"で検索すれば見つかるはず）．

   * なお，ライセンスはVisual Studioと同様である．本演習の範囲（学術目的の使用は無償なので）では気にすることはないが，商用のソフトウェアを作成する場合は有償ライセンスが必要となる場合がある．
     詳しくは[公式FAQ](https://code.visualstudio.com/docs/csharp/cs-dev-kit-faq#_who-can-use-c-dev-kit)を参照．

1. [Ionide for F#](https://marketplace.visualstudio.com/items?itemName=Ionide.Ionide-fsharp)をインストールする．やり方は上と同様．

2. [（オプショナル & Macの場合）`code`コマンドをインストールする]{#command_code_install}．コマンドパレット （Command + Shift + Pを押すと出てくる）から，

   ```text
   シェル コマンド: PATH 内に 'code' コマンドをインストールします
   Shell Command: Install 'code' command in PATH
   ```

   を選択し（当該コマンドは"Shell C"ぐらいまで入力した出てくるはず），`code`コマンドをインストールする．これによりターミナルから`code FOLDER`とすることでVSCodeを起動できるようになる．

   > [!NOTE]
   > [公式ドキュメント](https://code.visualstudio.com/docs/setup/mac#_launch-vs-code-from-the-command-line) によると，
   >
   > > Restart the terminal for the new `$PATH` value to take effect.
   > >
   > > You can now type 'code .' in any folder to start editing files in that folder.
   >
   > とあるが，私の環境だと`Shell Command: Install 'code' command in PATH`をすることで，`/usr/local/bin`下に実行形式ファイル`code`がインストールされた（そして記述に反して環境変数`PATH`は変更されなかった）ので，
   > もともと`/usr/local/bin`がパスに通っているのならばターミナルの再起動は必要がないかもしれない（2023年3月27日時点）．

## 動作確認

> [!NOTE]
> いずれの方法でも，フォルダを開くタイミングで「このフォルダー内のファイルの作成者を信頼しますか？」なるダイアログで出てくるかもしれない．その場合は，**今回については**自分が用意したファイルであるはずなので「はい，…」を選択する．

### C#編1（プロジェクトの作成にコマンドライン使用；本演習ではオススメ） {#cs_console}

1. ターミナルでプロジェクトを作成し，それを開く．

   > [!NOTE]
   > ここでいうプロジェクトとは一つの実行形式やライブラリを作成するためのコード等を全てまとめたものである（参考：[What are solutions and projects in Visual Studio?](https://docs.microsoft.com/en-us/visualstudio/ide/solutions-and-projects-in-visual-studio?view=vs-2022)）．プロジェクトの設定は`.csproj`ファイルに記述されている．

   * 方法1：ターミナル上で， [上に書いた](#check_dotnetsdk_install)ように`dotnet new console -o HelloWorldCS`で適当なプロジェクト（ここでは`HelloWorldCS`）を作成し，その後`code HelloWorldCS`でVSCodeを開く（Macの場合は`code`コマンドの[インストールが必要](#command_code_install)）．
      少し待つとC# Dev Kitがプロジェクトを認識する（「エクスプローラー」サイドバーに「ソリューション エクスプローラー」が増える）．

   * 方法2：VSCodeで作成したいプロジェクトと同名のフォルダ（``HelloWorldCS``とする）を開く（ **Windowsでは「ファイルを開く」ではなく「フォルダーを開く」から開く** ）．メニューの「表示」→「ターミナル」よりターミナルを起動・表示する．

     ![VSCodeの内蔵ターミナルは画面下部に表示される](images/vscode/vscode_terminal.png)\

     ターミナルで

     ```console
     dotnet new console -o .
     ```

     を実行し開いたフォルダと同名のプロジェクトを作成する．

     ![](images/vscode/vscode_dotnet_new.png)

     「エクスプローラ」サイドバーより``.cs``ファイルを選択して少し待つと，C# Dev Kitによりプロジェクトが認識される（同サイドバーに「SOLUTION EXPLORER」が増える）．        

   いずれの場合もC# Dev Kitがプロジェクトを認識した時点で，開いたフォルダ直下に``フォルダ名.sln``なるファイルが作成されるはず．

   > [!NOTE]
   > `.sln`はソリューションファイルと呼ばれる．ソリューションは関連する複数のプロジェクトをまとめたもの（参考：[What are solutions and projects in Visual Studio?](https://docs.microsoft.com/en-us/visualstudio/ide/solutions-and-projects-in-visual-studio?view=vs-2022)）

1. ターミナルから``dotnet run``を実行してもよいが，ここでは別の方法を紹介する．
   ``Program.cs``を左のエクスプローラーから選択して開き，エディタパネル *右上*（左にあるものではない）の「再生ボタンの右下に虫がついたアイコン」をクリックする．
   このボタンは``.cs``ファイルに関連するプロジェクトをデバッグ実行する（右側の ﹀ から通常の実行に切り替えられる）．

   ![](images/vscode/vscode_run_button.png)

1. しばらくすると，デバッグコンソールにデバッグメッセージとともに，プログラムの出力

   ```console
   Hello, World!
   ```

   が表示される．最初の実行では「実行とデバッグ」にサイドバーが切り替わるかもしれないが，アクティビティーバー（一番左にあるアイコンが並んでいるバー）の一番上のアイコン（マウスをホバーすると「エクスプローラー」と出るもの）を選択すると戻すことができる．メニューの「表示」→「エクスプローラー」を選択したのでもよい．

   ![より詳しくは，画面下部のデバッグコンソールに水色のデバッグメッセージとともに青色で"Hello World"が表示される](images/vscode/vscode_debug_console.png)\

   > [!NOTE]
   >「実行とデバッグ」サイドバーの「実行とデバッグ」からでも実行可能である．初回は「デバッガーの選択」や「起動構成の選択」等について聞かれるので，
   > それぞれ「C#」およびさっき作成したプロジェクト名を回答する．ショートカットキー``F5``（デバッグの開始）および``Ctrl + F5``（デバッグなしで実行）も
   > 活用するとよい．
   >
   > また，ターミナルから``dotnet run``を実行するのでもよい．

### C#編2（プロジェクト作成にC# Dev Kitの機能を利用）


1. 次のいずれかを行う．

   * VSCodeを起動し，どのフォルダも開いていない状態にて「エクスプローラー」サイドバー下部「.NET プロジェクトを作成」をクリックする．
   * あるいは「開く」から適当なフォルダを開き，コマンドパレット（WindowsはControl + Shift + P，MacはCommand + Shift + P）を起動し，

     ```text
     .NET: 新しいプロジェクト...
     .NET: New Project...
     ```

     を選択する．非常に多くのコマンドがリストされるが，当該コマンドは`.NET: N`のあたりまでタイプすると出てくるはず．

1. 「コンソール アプリ」を選択する．
1. 選択後の手順はステップは最初のステップにおける選択およびWindows/Macで少し異なる
   * *Windowsで「.NET プロジェクトを作成」からプロジェクトを作成しようとした場合*：「プロジェクトの場所」というファイル選択ダイアログが出てくるので，プロジェクトを置くフォルダを選択する．次にプロジェクト名を聞かれるので適当に選択する．デフォルトのままでもよい．
   * *プロジェクトをコマンドパレットから作成しようとした場合，あるいはMac*：その後プロジェクト名を聞かれるので適当に選択する．デフォルトのままでもよい．次に，どのフォルダの下に作成するかを聞かれるので適当に選択する．フォルダを開いてからコマンドパレットからプロジェクト作成を行った場合は，デフォルトではそのフォルダの直下になっている．
1. ターミナル（VSCodeのものでもよい）から`dotnet run`で実行してもよいし，「C#編1」に書いたように右上の「再生ボタンの右下に虫がついたアイコン」で実行してもよい．

### F#編

1. ターミナルでプロジェクトを作成し，それを開く．[C#編1（プロジェクトの作成にコマンドライン使用；本演習ではオススメ）](#cs_console) とほぼ同様
   の方法で `dotnet new console` コマンドに `-lang "F#"` というオプションを渡すだけなので，詳細は割愛．

1. （オプショナル）サイドバーをIonideのものに切り替える．アクティビティーバー（一番左にあるアイコンが並んでいるバー）からIonideのアイコンを選択することで切り替えられる．なお元にもどすには，アクティビティーバーの一番上のアイコン（マウスをホバーすると「エクスプローラー」と出るもの）を選択すればよい．

   ![](images/vscode/vscode_ionide.png)

1. ターミナルから``dotnet run``で実行する．
   サイドバー上部の実行ボタンからも実行できる…はずだが，Windows環境だとサイドバー上部の実行ボタンから実行すると，ターミナルが一瞬で閉じてしまう模様．
