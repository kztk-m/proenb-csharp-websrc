-----
title: 第0回 環境構築1（C#/F#共通）
date:  2022-03-24
tableOfContents: true
-----

以下の二つの方法を紹介する．
  
- Microsoft Visual Studioを用いる（`Windows編`_/`Mac編`_． 初心者向け）
 
- `.NET SDKのインストール （Windows/Mac ほぼ共通）`_ をしてコマンドラインインターフェースにて演習を進める（中級者向け）

後者は，仮想端末での作業に抵抗がなくかつ好みのエディタ（VSCode，Emacs，Viクローン等）を使用したい人にはおススメである．
本ページではLinuxにおける環境の構築法については述べない．

なお，このページで紹介している方法ではF#演習のための環境構築にもなっている．
C#演習の第5週・第6週目の課題を進めるには `さらなる準備（別ページ） <./setup_gui.html>`_ が必要である（こちらはC#演習分のみ）．


（本ページに掲載されているスクリーンショットは，マイクロソフトの許諾を得て使用しています．）



===========================
Visual Studioのインストール
===========================

.. role:: underline
   :class:underline 

---------
Windows編
---------
     
**インストール中はネットワーク接続が必要なことに注意する．**

#.  `Visual Studio 2022のページ <https://visualstudio.microsoft.com/ja/>`_ において「Visual Studioのダウンロード」にマウスポインタを合わせるといくつかの項目が表示される．その中の「Community 2022」を選択し，Visual Studio Community 2022をダウンロードする．

   すると ``VisualStudioSetup.exe`` というファイルがダウンロードされる．


#. ダウンロードしたファイルを実行する．「続行」を押す前にライセンス条項には目を通しておこう．
  

   #. 途中でインストールする項目が聞かれるので，「ワークロード」タブにある *「.NETデスクトップ開発」* をチェックし，その「インストール詳細」から
      *「F# デスクトップ言語のサポート」* にもチェックを入れる．7.8 GB弱のディスク容量が必要となる．
 
   .. image::images/ss_vs2022_win_installer.png 

#. 「インストール」ボタンを押してインストールを完了させる．2.2 GBほどのダウンロードが生じるので高速なネット回線が利用可能なところで行おう．

   ..
      .. image::images/ss_dl_win5.png 

#. 起動時にいろいろ聞かれるが適当に答えたのでよい（サインインのアカウントも好きなものでよいし，設定しなくてもよい）．
   インストールが終了すると自動的にVisual Studio Community 2022が起動され，以下の画面が表示される．インストーラのウィンドウのほうは閉じてOK．

   .. image::images/ss_vs2022_win_startup.png 

#. 動作確認もしておこう．
  
   i. 上記で「新しいプロジェクトの作成」を選ぶ．

   #. テンプレート選択画面で，C#の「コンソール アプリケーション」を選ぶ．

      .. image::images/ss_vs2022_win_template_selection.png 

   #. プロジェクト名とソリューション名を聞かれるので適当に入力する．たとえば，どちらも ``HelloWorldCS`` にしたのでよい（``CS``はC#の気持ち）．


      .. note:: 
        プロジェクトは一つの実行形式やライブラリを作成するためのコード等を全てまとめたものであり，ソリューションは関連するプロジェクトをまとめたもの（参考：`What are solutions and projects in Visual Studio? <https://docs.microsoft.com/en-us/visualstudio/ide/solutions-and-projects-in-visual-studio?view=vs-2022>`_）．
        あえて英語版にリンクしたのは，日本語版だと"a project contains all files that are compiled into an executable, library, or website"の"a"や"an"がうまく訳出されていないように感じたため．

      .. image::images/ss_vs2022_win_creating_project.png 

   #. フレームワークを選んで「作成」する．ここではデフォルトのままでよい．

      .. image::images/ss_vs2022_win_fw_selection.png 

   #. エディタで ``Program.cs`` が開かれた状態になる．

      .. image::images/ss_vs2022_win_editor.png 

   #. コードを実行するには上のツールバーの真ん中あたりにある「▶ HelloWorldCS」と書かれたボタンを押す．
      すると，ビルドが行われ実行形式が作成された後にその実行形式が実行される．
      ビルド時の出力等が表示された後に，「Microsoft Visual Studio デバッグコンソール」に ``Hello, World!`` と表示されればOK．

      .. image::images/ss_vs2022_win_output.png 

   #. F#でも同様であることを確認しておこう（新しいプロジェクトを作成する際のテンプレートを選ぶ場面で，「すべての言語」を「F#」に変更し，「コンソール アプリケーション」を選べばよい）．

      .. note:: 

         もし以上のとおりやった上でF#でのビルドに失敗し，「パッケージ FSharp.Core が見つかりません。ソース Microsoft Visual Studio Offline Packages には、この ID のパッケージが存在しません。」というエラーメッセージが出る場合は，コマンドライン（WindowsだとPowerShellか「コマンド プロンプト」を利用）から

         ::

            dotnet nuget add source https://api.nuget.org/v3/index.json -n nuget.org


         を実行する．あるいは，以下の「`.NET SDKのインストール （Windows/Mac ほぼ共通）`_」の手順1～4を読みSDKをインストールするとよい．（それでも直らなければ，教員・TAに質問をしてください．）
     

-----
Mac編
-----

.. C#演習ではVisual Studio 2019 for Macではなく，Visual Studio 2022 for Mac Previewの使用を推奨する．

.. .. note:: 

..    Visual Studio 2019 for Macだと，少くとも私の環境において，第5回および第6回の講義で利用予定である `Eto.Forms <https://github.com/picoe/Eto>`__ の利用に問題が生じためである．
..    より具体的には，私の環境だと `指示 <https://github.com/picoe/Eto/wiki/Quick-Start>`__ の通りに Eto.Addin.MonoDevelop.mpack の最新版を `Release <https://github.com/picoe/Eto/releases>`__ ページからダウンロードし，拡張機能としてインストールした後で，テンプレート選択画面で `Eto.Forms` を選んでプロジェクトを作成しようとするとソリューション名入力画面でVisual Studioが高い割合で落ちる．

..    プロジェクトやソリューションの作成をコマンドラインで実行した後で，Visual Studioを使うことも可能であるので，Visual Studio 2019 for Macでも演習を進めること自体は可能である．
..    あるいは，ディスク容量とインストール時間さえ気にしなければ，Visual Studio 2019 for Macをまずはインストールし，
..    C#の演習の第5・6回目の内容をすすめるときだけ，Visual Studio 2022 for Macを使うという手もある．
   


**インストール中はネットワーク接続が必要なことに注意する．**

#. `Visual Studio 2022のページ <https://visualstudio.microsoft.com/ja/>`_ より「Visual Studio for Macをダウンロード」をたどり，Visual Studio 2022 for Macをダウンロードする．


   すると ``visualstudioformacpreviewinstaller-17.5.0.124.dmg``みたいな名前のファイルがダウンロードされる（数字の部分はダウンロードするタイミングによって違うかもしれない）．


#. Dock上の「ダウンロード」から上のファイルをクリックする（あるいはFinderでダブルクリックすると），どでかいアイコンが表示されたウィンドウが表示されるので，
   アイコンをダブルクリックしてインストールを開始する．   


#. 「“Install Visual Studio for Mac.app”はインターネットからダウンロードされたアプリケーションです。開いてもよろしいですか?」と聞かれるので，「開く」．

  #. すると「ダウンロード」以下のファイルにアクセスしてよいか聞かれるが，許可する．

 
  #. その後「Visual Studio for Mac をダウンロードしていただき、ありがとうございます」と書かれた画面が表示される．
     ライセンス条項を確認し問題なければ「続行」を選んでインストールを続ける．
   
#. 「何をインストールしますか？」と聞かれる．「.NET」だけ選べば十分．

#.  あとは，画面に従ってインストールを完了させる（数十分ほど時間がかかるかもしれない）．また，何度かパスワードが聞かれる．

    .. image::images/ss_vs2022_mac_installer.png

#.  上で「完了時にVisual Studio Previewを開く」をチェックしていたら（なにもしていなければそうなっているはず），
    インストールが終了すると自動的にVisual Studio 2022 for Macが起動される．
    起動時にいろいろ聞かれるが適当に答えたのでよい（サインインのアカウントも好きなものでよいし，設定しなくてもよい）．
    最終的に「Visual Studio 2022 for Mac」と書かれたウィンドウが表示される．
    
   .. image::images/ss_vs2022_mac_start.png

#.  動作確認もしておこう．
    
    i. 上記のウィンドウ（一旦Visual Studioを閉じても，また起動すれば上記が表示される）で「新規」を選択する．

    #. テンプレート選択画面で「コンソールアプリケーション」を選ぶ．

       .. image::images/ss_vs2022_mac_template_selection.png

       - C#/F#の部分は使用する言語を選ぶ．両方の言語について動作確認しよう．

    #. ターゲットフレームワークを聞かれるので適当に選ぶ．

       .. image::images/ss_vs2022_mac_fw_selection.png

      ..  - Visual Studio 2022 for Macでは「.NET 6.0」も選べる．.NET 6.0を選ぶとテンプレートに含まれるHello Worldのプログラムが，
      ..    C# 9.0の新機能を利用したものとなる．

    #. プロジェクト名とソリューション名を聞かれるので適当に入力する．たとえば，どちらも ``HelloWorldCS`` にしたのでよい（``CS``はC#の気持ち）．

       .. note:: 

         プロジェクトは一つの実行形式やライブラリを作成するためのコード等を全てまとめたものであり，ソリューションは関連するプロジェクトをまとめたもの（参考：`What are solutions and projects in Visual Studio? <https://docs.microsoft.com/en-us/visualstudio/ide/solutions-and-projects-in-visual-studio?view=vs-2022>`_）．


       .. image::images/ss_vs2022_mac_creating_project.png

    #. エディタで ``Program.cs`` が開かれた状態になる．

       .. image::images/ss_vs2022_mac_editor.png 


    #. コードを実行するには左上のほうにある▶ボタンを押す．すると，ビルドが行われ実行形式が作成された後にその実行形式が実行される．
       ビルド時の出力等がされた後に以下のように「Terminal」/「ターミナル」に ``Hello, World!`` と表示されればOK．
       
       .. image::images/ss_vs2022_mac_output.png 

       * 右下の「ターミナル - HelloWorldCS」（``HelloWorldCS``の部分は具体的なプロジェクト名に置き換える）の上にマウスカーソルを合わせる必要があるかもしれない．いちいちマウスオーバーするのが面倒臭いのであれば右上の📌の形のボタンを押して（あるいは，ドロップダウンメニューから「ドッキング」を選択して）位置を固定しておくとよい．

         * 元のマウスオーバすると「枠」がポップアップする設定に戻すには📌を再び押すか，ドロップダウンメニューから「自動的に隠す」（「ドッキング解除」ではない）を選択する．

       .. note::

          2023/04/12 Xcode コマンドラインツールが原因でビルドに失敗することがある模様．以下を試みるとよいかもしれない．

          * Xcode コマンドラインツールのライセンスに同意する（ビルドメッセージにその旨が表示されているかも）
          * Xcode コマンドラインツールを更新する（もし「システム設定」の「ソフトウェアアップデート」に表示されているなら）

    #. 上記の動作確認はC#/F#の両方について行おう．


    .. note:: 

         もし以上のとおりやった上でF#でのビルドに失敗し，「パッケージ FSharp.Core が見つかりません。ソース Microsoft Visual Studio Offline Packages には、この ID のパッケージが存在しません。」というエラーメッセージが出る場合は，コマンドライン（MacだとTerminal.app）から

         ::

            dotnet nuget add source https://api.nuget.org/v3/index.json -n nuget.org


         を実行する．あるいは，以下の「`.NET SDKのインストール （Windows/Mac ほぼ共通）`_」の手順1～4を読みSDKをインストールするとよい．（それでも直らなければ，教員・TAに質問をしてください．）


.. note::

   Visual Studio for Mac をアンインストールする場合には，アプリケーションフォルダから当該アイコンをゴミ箱に入れるだけでは不十分である．
   完全にアンインストールするには`公式のアンインストール手順 <https://learn.microsoft.com/en-us/visualstudio/mac/uninstall?view=vsmac-2022>`__ に従ってアンインストールする必要がある．

==============================================
.NET SDKのインストール （Windows/Mac ほぼ共通）
==============================================

Visual Studioに含まれているので，上記を行っている場合は以下を行う必要はない．

1. `.NET SDKのダウンロードページ <https://dotnet.microsoft.com/ja-jp/download>`_ より，software development kit (SDK)をダウンロードする．
   - Windowsの人はWindows版のSDKをダウンロードする．
   - Mac版についてはいわゆるintel MacとM1 Macではダウンロードすべきものが違うので注意．前者はx64版を後者はArm64版をダウンロードしよう．

#. ダウンロードしたインストーラを実行し，指示に従ってインストールを完了する．
   - Windows版なら``dotnet-sdk-6.0.407-win-x64.exe``みたいな名前
   - Macのx64版なら``dotnet-sdk-6.0.407-osx-x64.pkg`` みたいな名前

#. ターミナル（WindowsだとPowerShellか「コマンド プロンプト」，MacだとTerminal.appやiTerm.app）を開き，以下を実行する．

   .. code:: 

      dotnet --list-sdks

   以下は私の環境における出力だが，このようにダウンロードしたSDK（6.0.XXX）が表示されたらばOK．
    
   .. code:: 

      6.0.400 [/usr/local/share/dotnet/sdk]
      6.0.407 [/usr/local/share/dotnet/sdk]
      7.0.202 [/usr/local/share/dotnet/sdk]

#. 動作確認もしておこう．
   
   i. 適当なディレクトリに移動して以下を実行する．

      .. code:: 
          
          dotnet new console -o HelloWorldCS 

      .. .. note::

      ..    ``--langVersion 8.0``の部分は必須ではない．単に，Visual Studio 2019 にて C#の「コンソール アプリケーション」テンプレートと
      ..    生成されるHello Worldのコードを一致させたかったためである．なお，上述のように Visual Studio 2022 を使用した場合は，
      ..    下記とは異なるHello Worldのコード（C# 9.0の機能を利用したもの）が出力される．
         

   #. ``HelloWorldCS`` というディレクトリができているので，そこに移動する．  

      .. code::
      
          cd HelloWorldCS 

      中身を``ls``で確認してみよう．たとえば，Macだと以下のように表示される（Windowsだと ``ls`` は ``dir`` の別名なので，表示は多少異なる）． 

      .. code::

          HelloWorldCS.csproj  Program.cs           obj/

      プログラムを書くには， ``Program.cs`` を変更すればよい．現時点では ``Program.cs`` の中身は以下の通りである．

      .. code:: cs 
      
         // See https://aka.ms/new-console-template for more information
         Console.WriteLine("Hello, World!");


   #. 以下をを実行してビルドする．

      .. code::
 
          dotnet build

   #. 以下を実行してビルドしたプログラムを実行する． 

      .. code::

          dotnet run 

      すると，"Hello, World!"が表示されるのが確認できるはずだ． 

   #. F#でも同様であることを確認しておこう（``dotnet new``を実行する場面で，``dotnet new console -o HelloWorldCS`` の代わりに ``dotnet new console -lang "F#" -o HelloWorldFS`` とする．また，このコマンドだと``HelloWorldCS``ではなく``HelloWorldFS``というディレクトリが作成される）


      .. .. note::

      ..    F#でもターゲットフレームワークが .NET 5.0 のときと .NET 6.0 のときで出力される Hello World のコードが変わる．

