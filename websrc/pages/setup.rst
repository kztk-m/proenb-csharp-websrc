-----
title: 環境構築
date:  2022-03-23
tableOfContents: true
-----

Visual Studioを用いる（初心者向け）か，あるいは.NETのSDKのみをインストールしてコマンドラインインタフェースにより演習を実施する（中級者向け）ことを推奨する．後者は，仮想端末での作業に抵抗がなくかつ好みのエディタ（VSCode，Emacs，Viクローン等）を使用したい人にはおススメである．
なお，Linux版のVisual Studioはないため，Linuxを利用したい場合は後者となる．

なお，このページの内容はC#/F#ともに共通である．C#演習の第5週・第6週目の課題を進めるには `さらなる準備（別ページ） <./setup_gui.html>`_ が必要である（こちらはC#演習分のみ）．


===========================
Visual Studioのインストール
===========================

---------
Windows編
---------

Visual Studio Community 2022を用いる．

#. `Visual Studioのダウンロードページ <https://visualstudio.microsoft.com/ja>`_ より，Visual Studio Community をインストールする．

   .. image::images/ss_dl_win1.png

   すると ``VisualStudioSetup.exe`` というファイルがダウンロードされる．

   .. image::images/ss_dl_win2.png 

#. ``VisualStudioSetup.exe`` を実行する．ライセンス条項には目を通しておこう．
  
   .. image::images/ss_dl_win3.png    

#. 途中でインストールする項目が聞かれるので，「ワークロード」タブにある「.NETデスクトップ開発」をチェックし，その「インストール詳細」から「F# デスクトップ言語のサポート」にもチェックを入れる．7.5 GB弱のディスク容量が必要となる．
 
   .. image::images/ss_dl_win4.png 

#. 「インストール」ボタンを押してインストールを完了させる．2 GBほどのダウンロードが生じるので高速なネット回線が利用可能なところで行おう．

   .. image::images/ss_dl_win5.png 

#. 起動時にいろいろ聞かれるが適当に答えると，最終的には以下の画面が表示される．インストーラは閉じてOK．

   .. image::images/ss_dl_win7.png 

# 動作確認もしておこう．
  
   i. 上記で「新しいプロジェクトの作成」を選ぶ．

   #. テンプレート選択画面で，C#の「コンソール アプリ」を選ぶ．

      .. image::images/ss_chk_win2.png 

   #. プロジェクト名とソリューション名を聞かれるので適当に入力する．たとえば，どちらも ``HelloWorldCS`` にしたのでよい（`CS`はC#の気持ち）．なお， `プロジェクトは一つの実行形式やライブラリを作成するためのコード等を全てまとめたものであり，ソリューションは関連するプロジェクトをまとめたもの <https://docs.microsoft.com/en-us/visualstudio/ide/solutions-and-projects-in-visual-studio?view=vs-2022>`_ ．

      .. image::images/ss_chk_win3.png 

   #. フレームワークを選んで「作成」する．これまでの手順に沿っていれば，.NET 6.0しか選べないはず．

      .. image::images/ss_chk_win4.png 

   #. エディタで ``Program.cs`` が開かれた状態になる．

      .. image::images/ss_chk_win5.png 

   #. コードを実行するには上の左よりのあたりにある「▶ HelloWorldCS」と書かれたボタンを押す．
      すると，ビルドが行われ実行形式が作成された後にその実行形式が実行される．
      ビルド時の出力等が表示された後に，以下のように「Microsoft Visual Studio デバッグコンソール」に ``Hello, World!`` と表示されればOK．

      .. image::images/ss_chk_win6.png 

   #. F#でも同様であることを確認しておこう．

-----
Mac編
-----

C#演習ではVisual Studio 2019 for Macではなく，2022 Previewの使用を推奨する．

.. note:: 

   より具体的には，Visual Studio 2019 for Macだと，第5回および第6回の講義で利用予定である `Eto.Forms <https://github.com/picoe/Eto>`__ の利用に問題がある（より具体的には， `指示 <https://github.com/picoe/Eto/wiki/Quick-Start>`_ の通りに Eto.Addin.MonoDevelop.mpack の最新版を `Release <https://github.com/picoe/Eto/releases>`__ ページからダウンロードし，拡張機能としてインストールした後で，新規ソリューションで `Eto.Forms` を選んで作成しようとすると私の環境だとVisual Studioが落ちる）ためである．

インストール中はネットワーク接続が必要なことに注意する．

#.  `Visual Studio 2022 for Mac プレビューのダウンロードページ <https://visualstudio.microsoft.com/ja/vs/mac/preview/>`_ より，
    Visual Studio 2020 for Macをダウンロードする．

    .. image::images/ss_dl_mac.png 

    すると ``visualstudioformacpreviewinstaller-17.0.0.191.dmg``みたいな名前のファイルがダウンロードされる（数字の部分はダウンロードするタイミングによって違うかもしれない）．

    .. image::images/ss_dl_mac2.png

#. 「ダウンロード」から上のファイルをクリックする（あるいはFinderでダブルクリックすると），どでかいアイコンが表示されたウィンドウが表示されるので，
   アイコンをダブルクリックしてインストールを開始する．

    .. image::images/ss_dl_mac3.png 

#. 「“Install Visual Studio for Mac Preview.app”はインターネットからダウンロードされたアプリケーションです。開いてもよろしいですか?」と聞かれるので，「開く」．

#. 以下の画面が表示されるので，文章を読んで問題がなければ「続行」を選んでインストールを続ける．

    .. image::images/ss_dl_mac4.png 


#. 「何をインストールしますか？」と聞かれる．「.NET」だけ選べば十分（要確認）．

#.  あとは，画面に従ってインストールを完了させる（数十分ほど時間がかかるかもしれない）．また，何度かパスワードが聞かれる．

    .. image::images/ss_dl_mac6.png 

#.  上で「完了時にVisual Studio Previewを開く」をチェックしていたら（なにもしていなければそうなっているはず），
    起動時にいろいろ聞かれるかもだが最終的に以下のようなウィンドウが表示される．2022年3月18日現在ではまだローカライズが完全でないようだ．

    .. image::images/ss_dl_mac7.png

#.  動作確認もしておこう．

    i. 上記で画面（一旦Visual Studioを閉じても，また開けば上記が表示されるはず）で，「New」あるいは「新規」を選択する．

    #. テンプレート選択画面で「Console Application」あるいは「コンソールアプリケーション」を選ぶ．

       .. image::images/ss_chk_mac2.png 

       - C#/F#は使用する言語を選ぶ．ここでは好きな言語を選んでおいたのでよいだろう．

    #. ターゲットフレームワークを聞かれるので適当に選ぶ．C#演習では net6.0 環境を想定．

       .. image::images/ss_chk_mac3.png 

    #. プロジェクト名とソリューション名を聞かれるので適当に入力する．たとえば，どちらも ``HelloWorldCS`` にしたのでよい（`CS`はC#の気持ち）．なお， `プロジェクトは一つの実行形式やライブラリを作成するためのコード等を全てまとめたものであり，ソリューションは関連するプロジェクトをまとめたもの <https://docs.microsoft.com/en-us/visualstudio/ide/solutions-and-projects-in-visual-studio?view=vs-2022>`_ ．

       .. image::images/ss_chk_mac4.png 

    #. エディタで ``Program.cs`` が開かれた状態になる．

       .. image::images/ss_chk_mac5.png 

       .. note::

          なお，上の画面のコードはC# 9.0の新機能が使用されている．net5.0はC#のバージョンが8であるため，ターゲットフレームワークにnet5.0等を選ぶと違うコードが表示されるだろう．


    #. コードを実行するには左上のほうにある▶ボタンを押す．すると，ビルドが行われ実行形式が作成された後にその実行形式が実行される．
       ビルド時の出力等がされた後に以下のように「Terminal」/「ターミナル」に ``Hello, World!`` と表示されればOK．
       
       .. image::images/ss_chk_mac6.png 


==============================================
.NET SDKのインストール （Windows/Mac ほぼ共通）
==============================================

Visual Studioに含まれているので，上記を行っている場合は以下を行う必要はない．

1. `.NET SDKのダウンロードページ <https://dotnet.microsoft.com/ja-jp/download>`_ より，software development kit (SDK)をダウンロードする．
   - Windowsの人はWindows版のSDKをダウンロードする．
   - Mac版についてはいわゆるintel MacとM1 Macではダウンロードするものが違うので注意．前者はx64版を後者はArm64版をダウンロードしよう．

#. ダウンロードしたインストーラを実行し，指示に従ってインストールを完了する．
   - Windows版なら``dotnet-sdk-6.0.201-win-x64.exe``みたいな名前
   - Macのx64版なら``dotnet-sdk-6.0.201-osx-x64.pkg`` みたいな名前

#. 以下「`Windows/Mac 共通`_」へ

#. ターミナル（WindowsだとコマンドプロンプトPowerShell，MacだとTerminal.appやiTerm.app）を開き ``dotnet --list-sdks`` を実行する．下記（私のMacでの実行例）のようにダウンロードしたSDK（6.0.XXX）が表示されたらばOK．
   なお，以下で ``$`` はプロンプトを表す（ので環境や設定によって異なる）．
   
   .. code:: bash

      $ dotnet --list-sdks
      3.1.417 [/usr/local/share/dotnet/sdk]
      5.0.406 [/usr/local/share/dotnet/sdk]
      6.0.201 [/usr/local/share/dotnet/sdk]

#. 動作確認もしておこう（F#の場合は ``dotnet new console -o HelloWorldCS`` の代わりに ``dotnet new console -o HelloWorldCS -lang F#`` とする）．
   
   i. 適当なディレクトリに移動して以下を実行する．

      .. code:: bash 
      
          $ dotnet new console -o HelloWorldCS

   #. ``HelloWorldCS`` というディレクトリができているので，そこに移動する．（Windowsだと ``ls`` は ``dir`` の別名なので，表示は多少異なる）

      .. code:: bash 
      
          $ cd HelloWorldCS 
          $ ls
          HelloWorldCS.csproj  Program.cs           obj/

      プログラムを書くには， ``Program.cs`` を変更すればよい．現時点では ``Program.cs`` の中身は以下の通りである．

      .. code:: cs 
      
         // See https://aka.ms/new-console-template for more information
         using System;
          
         Console.WriteLine("Hello, World!");


   #. ``dotnet build`` を実行する．

   #. ``dotnet run`` を実行する．

      .. code:: bash 

          $ dotnet run 
          Hello, World! 

   




