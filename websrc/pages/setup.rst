-----
title: 第0回 環境構築1（C#/F#共通）
date:  2022-03-24
tableOfContents: true
-----

.. caution:: 

   `2024年8月一杯でVisual Studio for Macの提供が廃止される <https://learn.microsoft.com/en-us/visualstudio/mac/what-happened-to-vs-for-mac?view=vsmac-2022>`_ こととなった．
   それにともない，今年は
     Visual Studio Code上でC# Dev KitおよびIonide for F#
   を用いた環境構築法を紹介することとする．Visual Studio を使いたい人は `昨年度の環境構築法 <./setup_gui_2023.html>`_ を参照されたし．

まずは，`.NET SDKのインストール`_ を行い，その後`Visual Studio Code (VSCode) のインストール・設定`_ を行う．
自分の好きなエディタ（viやEmacs等）を使用したい人は後者はしなくてもよい．

なお，このページで紹介している方法ではF#演習のための環境構築にもなっている．
C#演習の第5週・第6週目の課題を進めるには `さらなる準備（別ページ） <./setup_gui.html>`_ が必要である（こちらはC#演習分のみ）．

（本ページに掲載されているスクリーンショットは，マイクロソフトの許諾を得て使用しています．）

======================
.NET SDKのインストール 
======================

インストール
------------

#. `.NET SDKのダウンロードページ <https://dotnet.microsoft.com/ja-jp/download>`_ より，software development kit (SDK)をダウンロードする．
   - Windowsの人はWindows版のSDKをダウンロードする．
   - Mac版についてはいわゆるintel MacとAppleシリコン（M1やM2）のMacではダウンロードすべきものが違うので注意．前者はx64版を後者はArm64版をダウンロードしよう．

#. ダウンロードしたインストーラを実行し，指示に従ってインストールを完了する．
   - Windows版なら``dotnet-sdk-8.0.201-win-x64.exe``みたいな名前
   - Macのx64版なら``dotnet-sdk-8.0.201-osx-x64.pkg``/``dotnet-sdk-8.0.201-osx-arm64.pkg`` みたいな名前

#. ターミナル（WindowsだとPowerShellか「コマンド プロンプト」，MacだとTerminal.appやiTerm.app）を開き，以下を実行する．

   .. code:: 

      dotnet --list-sdks

   以下は私の環境における出力だが，このようにダウンロードしたSDK（8.0.XXX）が表示されたらばOK．
    
   .. code:: 

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

.. _check_dotnetsdk_install:

動作確認
--------

（動作確認は以下のVSCodeのインストール・設定後にも行うので，この時点では飛ばしてもよい）
   
1. 適当なフォルダに移動して以下を実行する．

   .. code:: 
      
      dotnet new console -o HelloWorldCS 


#. ``HelloWorldCS`` というフォルダができているので，そこに移動する．  

   .. code::
   
      cd HelloWorldCS 

   中身を``ls``で確認してみよう．たとえば，Macだと以下のように表示される（Windowsだと ``ls`` は ``dir`` の別名なので，表示は多少異なる）． 

   .. code::

      HelloWorldCS.csproj  Program.cs           obj/

   プログラムを書くには， ``Program.cs`` を変更すればよい．現時点では ``Program.cs`` の中身は以下の通りである（``cat Program.cs``を実行するなどすると見られる）．

   .. code:: cs 
   
      // See https://aka.ms/new-console-template for more information
      Console.WriteLine("Hello, World!");


#. 以下のコマンドを実行してビルドする．

   .. code::

      dotnet build

#. 以下を実行してビルドしたプログラムを実行する． 

   .. code::

      dotnet run 

   すると，``"Hello, World!"``が表示されるのが確認できるはずだ． 

#. F#でも同様であることを確認しておこう（``dotnet new``を実行する場面で，``dotnet new console -o HelloWorldCS`` の代わりに ``dotnet new console -lang "F#" -o HelloWorldFS`` とする．また，このコマンドだと``HelloWorldCS``ではなく``HelloWorldFS``というフォルダが作成される）



================================================
Visual Studio Code (VSCode) のインストール・設定
================================================

インストール・設定
------------------

#. https://code.visualstudio.com/ からインストーラをダウンロードする．

#. ダウンロードしたインストーラを実行し，指示に従いインストールする．

#. お好みで `Japanese Language Pack for Visual Studio Code <https://marketplace.visualstudio.com/items?itemName=MS-CEINTL.vscode-language-pack-ja>`_ をインストールし，UIを日本語にする．


   リンク先のウェブページの「Install」ボタンを押すと，「VSCodeで開きますか」旨の質問が表示されるのでそうする旨の選択する．
   すると，VSCode内で当該拡張機能のページが表示されるので，そこの"Install"ボタンを選択する．

   .. image::images/vscode/vscode_extension_j.png 
      :alt: "Install"ボタンは当該拡張機能のページの上部にある．

   あるいは， VSCode上で拡張機能の検索画面からインストールする．
   左下の歯車アイコンをクリックし"Extensions"を選択する．あるいは，WindowsだとControl + Shift + X，MacだとCommand + Shift + Xを押す．
   するとサイドバーが"EXTENSIONS"に切り替わる．サイドバー上部の検索欄から"Japanese"で検索すると"Japanese Language Pack for Visual Studio Code"が検索結果に現れると思うのでその"install"をクリックする．

   .. note::

      一番左のアイコンが並んでいるやつはアクティビティバーといってサイドバーではない．サイドバーはその隣のやつである．

   しばらくするとインストールが完了し，VSCodeの再起動が求められるので指示に従う．

#. `C# Dev Kit <https://marketplace.visualstudio.com/items?itemName=ms-dotnettools.csdevkit>`_ をインストールする．
   上と同様にリンク先のウェブページからインストールするか，左下の歯車アイコンをクリックし「拡張機能」を選択し，
   拡張機能サイドバーより検索してインストールする（"C#"で検索すれば見つかるはず）．
   
   * なお，ライセンスはVisual Studioと同様である．本演習の範囲（学術目的の使用は無償なので）では気にすることはないが，商用のソフトウェアを作成する場合は有償ライセンスが必要となる場合がある．
     詳しくは `公式FAQ <https://code.visualstudio.com/docs/csharp/cs-dev-kit-faq#_who-can-use-c-dev-kit>`_ を参照．

#. `Ionide for F# <https://marketplace.visualstudio.com/items?itemName=Ionide.Ionide-fsharp>`_ をインストールする．やり方は上と同様．

   .. note:: 

      これを入れると C#プロジェクトを開いた場合もIonideのサイドバーに勝手切り替わるので， **C#演習の間は無効化推奨**．
      無効にするには，左の歯車アイコンをクリックし「拡張機能」を選択し，その後サイドバーで当該拡張機能の
      右下の歯車アイコンをクリックし表示されるメニューから「無効にする」を選択する
      （有効にする際も最後に「有効にする」を選択する以外は同様）．


動作確認
--------

.. note:: 

   いずれの方法でも，フォルダを開くタイミングで「このフォルダー内のファイルの作成者を信頼しますか？」なるダイアログで出てくるかもしれない．
   その場合は，今回については自分が用意したファイルであるはずなので「はい，…」を選択する．


C#編1（プロジェクトの作成にコマンドライン使用；本演習ではオススメ） 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

i. ターミナルでプロジェクトを作成し，それを開く．

   .. note::

      ここでいうプロジェクトとは一つの実行形式やライブラリを作成するためのコード等を全てまとめたものである（参考：`What are solutions and projects in Visual Studio? <https://docs.microsoft.com/en-us/visualstudio/ide/solutions-and-projects-in-visual-studio?view=vs-2022>`_）．プロジェクトの設定は``.csproj``ファイルに記述されている．


   * 方法1：ターミナル上で， `上に書いた <#check_dotnetsdk_install>`_ ように``dotnet new console -o HelloWorldCS``で適当なプロジェクト（ここでは``HelloWorldCS``）を作成し，その後``code HelloWorldCS``でVSCodeを開く．
      少し待つとC# Dev Kitがプロジェクトを認識する（「エクスプローラー」サイドバーに「ソリューション エクスプローラー」が増える）．

   * 方法2：VSCodeで作成したいプロジェクトと同名のフォルダ（``HelloWorldCS``とする）を開く（ **Windowsでは「ファイルを開く」ではなく「フォルダーを開く」から開く** ）．メニューの「表示」→「ターミナル」よりターミナルを起動・表示する．

      .. image::images/vscode/vscode_terminal.png            
         :alt:   VSCodeの内蔵ターミナルは画面下部に表示される．

      ターミナルで
      
      .. code::
      
         dotnet new console -o .
      
      を実行し開いたフォルダと同名のプロジェクトを作成する．
      
      .. image::images/vscode/vscode_dotnet_new.png

      「エクスプローラ」サイドバーより``.cs``ファイルを選択して少し待つと，C# Dev Kitによりプロジェクトが認識される（同サイドバーに「SOLUTION EXPLORER」が増える）．        

   

   いずれの場合もC# Dev Kitがプロジェクトを認識した時点で，開いたフォルダ直下に``フォルダ名.sln``なるファイルが作成されるはず．

   .. note:: 

      ``.sln``はソリューションファイルと呼ばれる．ソリューションは関連する複数のプロジェクトをまとめたもの（参考：`What are solutions and projects in Visual Studio? <https://docs.microsoft.com/en-us/visualstudio/ide/solutions-and-projects-in-visual-studio?view=vs-2022>`_）

#. ターミナルから``dotnet run``を実行してもよいが，ここでは別の方法を紹介する．
   ``Program.cs``を左のエクスプローラーから選択して開き，エディタパネル *右上*（左にあるものではない）の「再生ボタンの右下に虫がついたアイコン」をクリックする．
   このボタンは``.cs``ファイルに関連するプロジェクトをデバッグ実行する（右側の ﹀ から通常の実行に切り替えられる）．

   .. image::images/vscode/vscode_run_button.png       

#. しばらくすると，デバッグコンソールにデバッグメッセージとともに，プログラムの出力

   .. code::
      
      Hello, World!
      
   が表示される．最初の実行では「実行とデバッグ」にサイドバーが切り替わるかもしれないが，アクティビティーバー（一番左にあるアイコンが並んでいるバー）の一番上のアイコン（マウスをホバーすると「エクスプローラー」と出るもの）を選択すると戻すことができる．メニューの「表示」→「エクスプローラー」を選択したのでもよい．


   .. image::images/vscode/vscode_debug_console.png
      :alt:   より詳しくは，画面下部のデバッグコンソールに水色のデバッグメッセージとともに青色で"Hello World"が表示される．

   .. note::

      「実行とデバッグ」サイドバーの「実行とデバッグ」からでも実行可能である．初回は「デバッガーの選択」や「起動構成の選択」等について聞かれるので，
      それぞれ「C#」およびさっき作成したプロジェクト名を回答する．ショートカットキー``F5``（デバッグの開始）および``Ctrl + F5``（デバッグなしで実行）も
      活用するとよい．

      また，ターミナルから``dotnet run``を実行するのでもよい．


C#編2（プロジェクト作成にC# Dev Kitの機能を利用）
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. caution:: 

   2024年3月12日現在，この方法ではEto.Formsプロジェクトを直接作成はできない．また，C# Dev Kitの機能を使うためのF#プロジェクトも作成できない．

i. 次のいずれかを行う．

   * VSCodeを起動し，どのフォルダも開いていない状態にて「エクスプローラー」サイドバー下部「.NET プロジェクトを作成」をクリックする．
   * あるいは「開く」から適当なフォルダを開き，コマンドパレット（WindowsはControl + Shift + P，MacはCommand + Shift + P）を起動し，
      
      .. code::
         
         .NET: 新しいプロジェクト...
         .NET: New Project...
      
      を選択する．非常に多くのコマンドがリストされるが，当該コマンドは``.NET: N``のあたりまでタイプすると出てくるはず．


#. 「コンソール アプリ」を選択する．
#. 選択後の手順はステップは最初のステップにおける選択およびWindows/Macで少し異なる
   * Windowsで「.NET プロジェクトを作成」からプロジェクトを作成しようとした場合：「プロジェクトの場所」というファイル選択ダイアログが出てくるので，プロジェクトを置くフォルダを選択する．次に
      プロジェクト名を聞かれるので適当に選択する．デフォルトのままでもよい．
   * プロジェクトをコマンドパレットから作成しようとした場合，あるいはMac：その後プロジェクト名を聞かれるので適当に選択する．デフォルトのままでもよい．次に，どのフォルダの下に作成するかを聞かれるので適当に選択する．フォルダを開いてからコマンドパレットからプロジェクト作成を行った場合は，デフォルトではそのフォルダの直下になっている．
#. ターミナル（VSCodeのものでもよい）から``dotnet run``で実行してもよいし，「C#編1」に書いたように右上の「再生ボタンの右下に虫がついたアイコン」で実行してもよい．


F#編
~~~~

i. ターミナルでプロジェクトを作成し，それを開く．`C#編1（プロジェクトの作成にコマンドライン使用；本演習ではオススメ）`_ とほぼ同様
   の方法で ``dotnet new console`` コマンドに ``-lang "F#"`` というオプションを渡すだけなので，詳細は割愛．

#. 少し待つとサイドバーがIonideのものに切り替わる．         

   .. image::images/vscode/vscode_ionide.png 

#. ターミナルから``dotnet run``で実行する．
   サイドバー上部の実行ボタンからも実行できる…はずだが，Windows環境だとサイドバー上部の実行ボタンから実行すると，ターミナルが一瞬で閉じてしまう模様．
