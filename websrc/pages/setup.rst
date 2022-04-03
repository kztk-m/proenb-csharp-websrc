-----
title: 環境構築
date:  2022-03-24
tableOfContents: true
-----

以下の二つの方法を紹介する．
  
   - Visual Studioを用いる（`Windows編`_/`Mac編`_． 初心者向け）
 
   - `.NET SDKのインストール （Windows/Mac ほぼ共通）`_ をしてコマンドラインインターフェースにて演習を進める（中級者向け）

後者は，仮想端末での作業に抵抗がなくかつ好みのエディタ（VSCode，Emacs，Viクローン等）を使用したい人にはおススメである．
本ページではLinuxにおける環境の構築法については述べない．

なお，このページで紹介している方法ではF#演習のための環境構築にもなっている．
C#演習の第5週・第6週目の課題を進めるには `さらなる準備（別ページ） <./setup_gui.html>`_ が必要である（こちらはC#演習分のみ）．



===========================
Visual Studioのインストール
===========================

---------
Windows編
---------

C#演習ではVisual Studio Community 2019 （ *最新版ではない* ）を用いる．

.. note:: 
     
     最新版はVisual Studio Community 2022だが，C#演習の第5週・第6週目の課題で使用するライブラリを使用するためのVisual Studio拡張がVisual Studio 2019向けであるためである．プロジェクトやソリューションの作成をコマンドラインで実行した後で，Visual Studioを使うことも可能であるので，Visual Studio Community 2022でも演習を進めること自体は可能である．あるいは，ディスク容量とインストール時間さえ気にしなければ，Visual Studio Community 2022をまずはインストールし，C#演習の第5週・第6週目の課題を進めるときだけ Visual Studio Community 2019を用いることも可能である．
     


#. `Visual Studio 2019のリリースノート <https://docs.microsoft.com/ja-jp/visualstudio/releases/2019/release-notes>`_ より，
   "Download Community 2019"のリンクをクリックし，Visual Studio Community 2019をダウンロードする．

   .. image::images/ss_dl_win1.png

   すると ``vs_community__英数字の列.exe`` というファイルがダウンロードされる．

   .. image::images/ss_dl_win2.png 

#. ダウンロードしたファイルを実行する．ライセンス条項には目を通しておこう．
  
   .. image::images/ss_dl_win3.png    

   #. 途中でインストールする項目が聞かれるので，「ワークロード」タブにある「.NETデスクトップ開発」をチェックし，その「インストール詳細」から「F# デスクトップ言語のサポート」にもチェックを入れる．6 GB強のディスク容量が必要となる．
 
   .. image::images/ss_dl_win4.png 

#. 「インストール」ボタンを押してインストールを完了させる．1.5 GBほどのダウンロードが生じるので高速なネット回線が利用可能なところで行おう．

   .. image::images/ss_dl_win5.png 

#. 起動時にいろいろ聞かれるが適当に答えると，最終的には以下の画面が表示される．インストーラは閉じてOK．

   .. image::images/ss_dl_win7.png 

# 動作確認もしておこう．
  
   i. 上記で「新しいプロジェクトの作成」を選ぶ．

   #. テンプレート選択画面で，C#の「コンソール アプリ」を選ぶ．

      .. image::images/ss_chk_win2.png 

   #. プロジェクト名とソリューション名を聞かれるので適当に入力する．たとえば，どちらも ``HelloWorldCS`` にしたのでよい（``CS``はC#の気持ち）．


      .. note:: 
        プロジェクトは一つの実行形式やライブラリを作成するためのコード等を全てまとめたものであり，ソリューションは関連するプロジェクトをまとめたもの（参考：`What are solutions and projects in Visual Studio? <https://docs.microsoft.com/en-us/visualstudio/ide/solutions-and-projects-in-visual-studio?view=vs-2022>`_）．
        あえて英語版にリンクしたのは，日本語版だと"a project contains all files that are compiled into an executable, library, or website"の"a"や"an"がうまく訳出されていないように感じたため．

      .. image::images/ss_chk_win3.png 

   #. フレームワークを選んで「作成」する．ここではデフォルトのままでよい．

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

    #. ターゲットフレームワークを聞かれるので適当に選ぶ．

       .. image::images/ss_chk_mac3.png 

    #. プロジェクト名とソリューション名を聞かれるので適当に入力する．たとえば，どちらも ``HelloWorldCS`` にしたのでよい（`CS`はC#の気持ち）．なお， `プロジェクトは一つの実行形式やライブラリを作成するためのコード等を全てまとめたものであり，ソリューションは関連するプロジェクトをまとめたもの <https://docs.microsoft.com/en-us/visualstudio/ide/solutions-and-projects-in-visual-studio?view=vs-2022>`_ ．

       .. image::images/ss_chk_mac4.png 

    #. エディタで ``Program.cs`` が開かれた状態になる．

       .. image::images/ss_chk_mac5.png 

       .. note::

          なお，上の画面のコードの中身がWindows編のスクリーンショットのものと違うのは，net6.0用のテンプレートではC# 9.0の新機能が使用した
          コード使用されるためである． **本演習ではC# 9.0の新機能は使用しない．**


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

#. ターミナル（WindowsだとコマンドプロンプトPowerShell，MacだとTerminal.appやiTerm.app）を開き，以下を実行する．

   .. code:: 

      dotnet --list-sdks

   以下は私の環境における出力だが，このようにダウンロードしたSDK（6.0.XXX）が表示されたらばOK．
    
   .. code:: 

      3.1.417 [/usr/local/share/dotnet/sdk]
      5.0.406 [/usr/local/share/dotnet/sdk]
      6.0.201 [/usr/local/share/dotnet/sdk]

#. 動作確認もしておこう（F#の場合は ``dotnet new console -o HelloWorldCS`` の代わりに ``dotnet new console -o HelloWorldCS -lang F#`` とする）．
   
   i. 適当なディレクトリに移動して以下を実行する．

      .. code:: 
          
          dotnet new console -o HelloWorldCS --langVersion 8.0

   #. ``HelloWorldCS`` というディレクトリができているので，そこに移動する．  

      .. code::
      
          cd HelloWorldCS 

      中身を``ls``で確認してみよう．たとえば，Macだと以下のように表示される（Windowsだと ``ls`` は ``dir`` の別名なので，表示は多少異なる）． 

      .. code::

          HelloWorldCS.csproj  Program.cs           obj/

      プログラムを書くには， ``Program.cs`` を変更すればよい．現時点では ``Program.cs`` の中身は以下の通りである．

      .. code:: cs 
      
          using System;
          
          namespace HelloWorldCS
          {
              class Program
              {
                  static void Main(string[] args)
                  {
                      Console.WriteLine("Hello, World!");
                  }
              }
          }


   #. 以下をを実行してビルドする．

      .. code::
 
          dotnet build

   #. 以下を実行してビルドしたプログラムを実行する． 

      .. code::

          dotnet run 

      すると，"Hello, World!"が表示されるのが確認できるはずだ． 

   




