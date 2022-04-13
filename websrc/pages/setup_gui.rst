-----
title: 第0回 環境構築2（C#演習用）
date:  2022-03-24
tableOfContents: true
-----

C#演習第5・6回課題ではクロスプラットフォームGUIフレームワーク`Eto.Forms <https://github.com/picoe/Eto>`__を用いるので，その環境をセットアップする．
`環境設定1 <./setup.html>`__で「Visual Studioのインストール」を選んだ人は，`Visual Studioの設定`_を，
「.NET SDKのインストール （Windows/Mac ほぼ共通）」を選んだ人は「`コマンドライン環境の設定`_」を参照する．

また，GTK用アプリケーションを作成したい人は`GTKのインストール`_を参照する（現状Mac環境のみ記載．Windows環境は情報収集中）．




（本ページに掲載されているスクリーンショットは，マイクロソフトの許諾を得て使用しています．）


===================
Visual Studioの設定
===================

---------
Windows編
---------

Visual Studio 2019を用いる．Eto.Formsの拡張機能は令和4年3月24日(木)時点ではまだVisual Studio 2022に対応していない．

1. Visual Studioを起動し，メニューバーが表示されている状態にする（たとえば，スタート画面から「コードなしで続行」する）．

   .. image::images/ss_eto/win1.png

#. メニューの「拡張機能」以下の「拡張機能の管理」を開く．

   .. image::images/ss_eto/win2.png
   
   すると拡張機能の管理ウィンドウが表示されるので，右上の検索窓から"Eto.Forms"を検索する．すると，"Eto.Forms Visual Studio Addin"がリストされるので，
   「ダウンロード」する．

   .. image::images/ss_eto/win4.png

   ..
      .. image::images/ss_eto/win3.png


#. すると，「変更内容がスケジュールされます。すべての Microsoft Visual Studio ウィンドウを閉じると変更が開始されます。」と
   表示されるので，一旦Visual Studioを終了させる．

#. その後，以下のウィンドウが表示されるので，「Modify」を選択する．

   .. image::images/ss_eto/win5.png


#. Visual Studioを再度立ち上げる．正しくインストールできていると，「新しいプロジェクト」作成時のテンプレート選択画面で「Eto.Forms Application」が選べるようになる．

   .. image::images/ss_eto/win6.png

   .. note::

      Visual Studio 2019 を既にインストールしてあった場合に，そのバージョンが古いままだとこのステップでエラーが出るようである．
      その場合はメニューの「ヘルプ」から「更新プログラムの確認」を確認して更新を実施する．
      

#. 動作確認ついでに「続行」からプロジェクトを作成してみよう．例のごとくプロジェクト名とソリューション名は適当でよい（``HelloEto``とする）．

   .. image::images/ss_eto/win7.png

   プロジェクト名とソリューション名を入力後，以下のウィンドウが表示されるがこれは何も変更しなくてよい．

   .. image::images/ss_eto/win8.png


#. 作成すると，``HelloEto`` の他に ``HelloEto.Mac``，``HelloEto.Gtk``，``HelloEto.Wpf``というプロジェクトが作成されていることがわかる．
   演習では``HelloEto``（に相当するフォルダ）以下の``MainForm.cs``を編集することになる．
   ここでは，``HelloEto.Wpf``をビルド・実行する．（``HelloEto.Mac``はビルドできるがWindowsで実行できない．``HelloEto.Gtk``もビルドできるが実行にGTKのインストールが必要）．

   .. image::images/ss_eto/win9.png

   .. note::
      
      ここから先のステップは，Visual Studio 2022でも実行可能である（作成したソリューションを開けばよい）．
      ただし，以下のMac版と同様にターゲットフレームワークの問題が生じる場合がある．

#. ▶ボタンの左の枠から「HelloEto.Wpf」を選ぶ．選択後，右のソリューションエクプローラーで同プロジェクトが太字になる．

   .. image::images/ss_eto/win_wpf1.png


#. ▶ボタンを押すと，以下のウィンドウが表示される．

   .. image::images/ss_eto/win_wpf2.png

#. いつものようなウィンドウタイトルや閉じるボタンが表示されていないように見えるかもしれないが，
   ウィンドウを拡大したら隠れていただけであったことがわかる．黒いパネルはVisual Studio由来であり，実際にコマンドラインからビルド・実行すると表示されない．

   .. image::images/ss_eto/win_wpf3.png

#. "Click Me!"と書かれた部分をクリックするとダイアログが表示される．

#. ウィンドウ右上の閉じるボタンか，Ctrl + Q を押すか，メニューからQuitを選択してプログラムを終了する．



-----
Mac編
-----



1. `Eto.Fromのリリースページ <https://github.com/picoe/Eto/releases>`_ から，``Eto.Addin.VisualStudio.Mac-X.X.X.mpack`` の最新版を入手する． 
   令和4年3月23日(水)時点での最新版は ``Eto.Addin.VisualStudio.Mac-2.6.1.mpack``．

#. メニューの「Visual Studio」以下の「Extensions...」（または「拡張機能...」）を開く．

   ..
      .. image::images/ss_eto/mac1.png

#. ウィンドウが出てくるので，「ファイルからインストール...」を選び，先程のダウンロードした.mackファイルを選択する．

   ..
      .. image::images/ss_eto/mac2.png

#. すると，「次のパッケージがインストールされます」と出てくるので，「install」をクリックしインストールする．

   ..
      .. image::images/ss_eto/mac3.png

#. Visual Studio を再起動する．

#. 正しくインストールできていると，「新しいプロジェクト」作成時のテンプレート選択画面で「Multiplatform」（あるいは「マルチプラットフォーム」）以下から「Eto Application」が選べるようになる．

   ..
      .. image::images/ss_eto/mac4.png

#. 動作確認ついでに「続行」からプロジェクトを作成してみよう．例のごとくプロジェクト名とソリューション名は適当でよい（``HelloEto``とする）．
   **ターゲットフレームワークは".NET 6.0"を選択する．**
   
   .. note:: 

      "Eto Application"テンプレートを選んだ際に，ターゲットフレームワークの選択画面…というより，
      Windowsの実行例にあったようなEto.Forms特有の項目の選択画面が出てこないことがあるようである．
      その場合の対処法はいくつかの選択肢がある．

      - 手動でターゲットフレームワークを .NET 6.0 にする．具体的には，実行したいプロジェクトをダブルクリックして出てくるウィンドウにて，
        「ビルド」>「全般」の「Target framework」を「.NET 6.0」にする．

      - .NET 5.0 Runtimeあるいは.NET 5.0 SDKをインストールする．これらは，`<https://dotnet.microsoft.com/ja-jp/download/dotnet/5.0>`_
        から入手できる．ただし， `.NET 5.0のサポートは2022/05/08に終了予定であり，それ以降はセキュリティアップデートも提供されなくなる <https://devblogs.microsoft.com/dotnet/dotnet-5-end-of-support-update/>`_．


#. 作成すると，``HelloEto`` の他に ``HelloEto.Mac``，``HelloEto.Gtk``，``HelloEto.Wpf``というプロジェクトが作成されていることがわかる．
   演習では``HelloEto``（に相当するフォルダ）以下の``MainForm.cs``を編集することになる．
   このうち，``HelloEto.Wpf``はMac版のVisual Studioではビルドできない．ここでは，動作確認のために``HelloEto.Mac``を（GTKをインストールするのであれば``HelloEto.Gtk``も）実行してみよう．


    .. caution::
       
       `Microsoftの著作物利用のガイドラインを見ると<https://www.microsoft.com/en-us/legal/intellectualproperty/copyright/permissions>`__，
       Visual Studio 2022 for Macはまだ正式リリース前なのでスクリーンショットを掲載できないようである．
       このプロジェクトの作成以降は Visual Studio 2019 for Mac を用いたので問題がない…わけではないがなんとかなりはするので，
       代わりにVisual Studio 2019 for Macのスクリーンショットを用いて説明する．画面の構成に大きく違いがあれば都度述べる．

   .. image::images/ss_eto/mac6.png

   - `HelloEto.Mac`

     i. ▶ボタンの右に「HelloEto.Mac」が表示されていなければ，その部分をクリックして「HelloEto.Mac」を選択する．左の「ソリューション」の部分で，プロジェクト名「HelloEto.Mac」が太字になっていることを確認する．

        ..
           .. image::images/ss_eto/mac_mac1.png 

     #. ここで，Visual Studio 2022 for Mac Previewにおいては▶ボタンがかなづちボタンになっていることに気付くかもしれない．
        これは，Visual Studioはビルドしかせず，実行してくれないことを表している．
        （Visual Studio 2019 for Macだと「▶」のままだが，同様の問題がある．）
        実行するには設定が必要になる．
   
        .. note::

           少なくとも私（松田）の環境においてVisual Studio 2019 for Macのバージョン 8.10.21 (build 4)ではそもそもビルドに失敗する．
           この問題の一番簡単なワークアラウンドは，Visual Studio 2022 for Mac PreviewやVSCode等を使うことだが，
           `プロジェクトファイルを修正することでもVisual Studio 2019 for Macでもプロジェクトをビルドできるようになる（Thanks, Curtis Wensley氏）． <https://github.com/picoe/Eto/issues/2180#issuecomment-1088189064>`__

           具体的には ``プロジェクト名.Mac`` 以下にある ``プロジェクト名.Mac.csproj`` を以下に述べる通りに編集する（Visual Studio上では，プロジェクトを
           右クリックして，コンテキストメニューから「プロジェクト ファイルの編集」を選ぶことで編集できる）．

           おそらく行頭にある

           .. code:: xml
                     
              <Project Sdk="Microsoft.NET.Sdk">
            
           を

           .. code:: xml 

              <Project Sdk="Microsoft.NET.Sdk" TreatAsLocalProperty="UseAppHost">

           のように変更し，その直下にある

           .. code:: xml

                <PropertyGroup>
                  <OutputType>Exe</OutputType>
                  <!-- 中略 --> 
                </PropertyGroup>
                  
           の部分に

           .. code:: xml

                <PropertyGroup>
                  <OutputType>Exe</OutputType>
                  <!-- 中略 --> 
                  <UseAppHost>True</UseAppHost>
                </PropertyGroup>

           と``<UseAppHost>True</UseAppHost>``を追加する．

           
        .. note:: 

           `生成された実行形式を起動するには，生成された.appファイルをopenするか，その中の実行ファイルを実行する必要がある <https://github.com/picoe/Eto/wiki/Quick-Start#visual-studio-for-mac-86>`_ ．
           この点は ``dotnet`` を用いる場合でも同様である．

     #. 左の「ソリューション」の ``HelloEto.Mac`` の部分をダブルクリックすると，プロジェクトオプション編集用ウィンドウが表示される．
        「実行」>「構成」>「Default」の項目から，「開始アクション」の「外部プログラムの開始」に以下を入力する（.appの中身なので，「...」ボタンからは選択できない）．

        .. code:: 
            
            bin/Debug/net5.0/HelloEto.Mac.app/Contents/MacOS/HelloEto.Mac

        .. image::images/ss_eto/mac_mac2.png

        （スクリーンショットはVisual Studio 2019 for Macのもの．Visual Studio 2022 for Mac Previewだとこのパネルのデザインが多少異なる．）
        この変更は一回行うのみでよい．

        .. note::

           Visual Studio 2019 for Macだと絶対パスでないとうまくいかないようだったが，
           上記のように相対パスを入力してもVisual Studio 2022 for Mac Previewで一度実行に成功してからは，
           Visual Studio 2019 for Mac上でも実行に成功するようになった．

           詳しい情報がわかれば追記するが，Visual Studio 2022 for Macの正式版が出るほうが先になるかもしれない．
           

     #. しばらく待つと，Eto.Formsのアイコン（テンプレート選択画面で表示される円の中に菱形のもの）のアプケーションが起動していることが確認できるので，
        アイコンをクリックするなりしてフォーカスをそのアプリケーションに写す．

        ..
           .. image::images/ss_eto/mac_mac3.png 

     #. 以下のようなウィンドウが表示される．

        .. image::images/ss_eto/mac_mac4.png 

     #. ツールバー上のボタン「Click Me!」は初期ウィンドウサイズだと隠れてしまっている．拡張して表示しよう．

        .. image::images/ss_eto/mac_mac5.png 

     #. 「Click Me!」の上の部分にマウスポインタを持ってくると，色が変わる部分があるのでそこをクリックするとダイアログが表示される．

        - 「Click Me!」自体はクリックできない．

        .. image::images/ss_eto/mac_mac6.png 


     #. Command + Q を押すか，メニューからQuitを選択してプログラムを終了する．
         
        .. caution:: 

            ウィンドウ左上の閉じるボタンはプログラムを終了させない．この挙動はMacの一般的なアプリケーションプログラムと同様である．

   - `HelloEto.Gtk`
  
     i. GTKをインストールする（参考：`GTKのインストール`_）

     #. ▶ボタンの右に「HelloEto.Gtk」が表示されていることを確認する．そうでなければ，その部分をクリックして「HelloEto.Gtk」を選択する．
        左の「ソリューション」の部分で，プロジェクト名``HelloEto.Gtk`` が太字になっていることを確認する．
        
        ..
           .. image::images/ss_eto/mac_gtk1.png

     #. しばらく待つと，「実行形式ファイル」アイコンのアプケーションが起動していることが確認できるので，アイコンをクリックするなりしてフォーカスをそのアプリケーションに写す．

        ..
           .. image::images/ss_eto/mac_gtk2.png

     #. 以下のようなウィンドウが表示される．

        .. image::images/ss_eto/mac_gtk3.png

     #. "Click Me!"と書かれたボタンをクリックするとダイアログが表示される．

     #. ウィンドウ左上の閉じるボタンか，Ctrl + Q を押すか，メニューからQuitを選択してプログラムを終了する．



========================
コマンドライン環境の設定
========================

WindowsだとPowerShell，Macだと適当な仮想端末アプリケーション（Terminal.app）を使って以下を実行する．

1. 以下を行う（設定自体はこれで終わり）．

   .. code:: 
 
       dotnet new -i "Eto.Forms.Templates::*"

#. 確認のために以下を実行してみる．

   .. code:: 

       dotnet new -l eto


   .. note::

      ``dotnet``のバージョンによっては，``dotnet new eto -l``のように書かなけれならないかもしれない．

   たとえば，以下のように表示されるはず．

   .. code:: 

       これらのテンプレートは、入力: 'eto' と一致しました
       
       テンプレート名             短い名前  言語        タグ
       -------------------------  --------  ----------  ------------------
       Eto Application            etoapp    [C#],F#,VB  Cross Platform/Eto
       Eto Panel, Dialog or Form  etofile   [C#],F#,VB  Cross Platform/Eto

#. 動作確認

   i. 適当なディレクトリに移動し，その下に適当な名前のディレクトリを作成する（``HelloEto``とする）

      .. code:: 

          mkdir HelloEto 

   #. 作成したディレクトリに移動する．

      .. code::

          cd HelloEto 

   #. 以下を実行する．     

      .. code:: 
   
          dotnet new etoapp -f net6.0 

      その後``ls``してみると以下のようなディレクトリが生成されたのがわかる（Windowsだと``ls``は``dir``の別名なので表示は異なる）．

      .. code:: 

          $ ls 
          HelloEto/     HelloEto.Gtk/ HelloEto.Mac/ HelloEto.Wpf/

  #. buildおよび実行してみる．

     - Windowsの場合，まず以下を実行しプロジェクトHelloEto.Wpfをビルドする．

       .. code:: 
          
          dotnet build HelloEto.Wpf 

       その後以下のコマンドでビルドしたプログラムを実行する．
           
       .. code::

          dotnet run --project HelloEto.Wpf

       .. note::

          「warning NU1701: パッケージ XXXX はプロジェクトのターゲット フレームワーク YYYY ではなく ZZZZ を使用して復元されました。このパッケージは、使用しているプロジェクトと完全な互換性がない可能性があります。」という警告が多数表示されるが，他にエラーや警告がなければ無視してよい．

       .. note::
          
          Mac環境だと .Wpf版はビルドできない．

     - Macの場合，まず以下を実行しプロジェクトHelloEto.Macをビルドする．

       .. code::

           dotnet build HelloEto.Mac

       その後以下のコマンドでビルドしたプログラムを実行する（net5.0の部分は対象のフレームワークによって異なる）．

       .. code::

           open HelloEto.Mac/bin/Debug/net5.0/HelloEto.Mac.app

       .. caution:: 

          ``dotnet run --project HelloEto.Mac`` では実行に失敗する．

       .. note::
          
          Windows環境だと，.Mac版はビルドできるが実行できない．

     - GTKがインストールされているのならば（参考：`GTKのインストール`_），GTK版をビルド・実行してみるのもよい．
       まず，以下を実行しビルドする．

       .. code:: 

          dotnet build HelloEto.Gtk

       つぎに，以下を実行しビルドしたプログラムを実行する．

       .. code::

          dotnet run --project HelloEto.Gtk


     .. note::

        Visual Studio 2019 で作成したプロジェクトを実行するときなど，ターゲットフレームワークが .NET 5.0 になっている
        にもかかわらず，.NET 5 のランタイムがインストールされていない場合はいかのいずれかを実行する．

        - ターゲットフレームワークを .NET 6.0 に変更する．具体的には各プロジェクトファイル（拡張子：.csproj）の

          .. code:: xml

             <TargetFramework>net5.0</TargetFramework>

          となっている部分を

          .. code:: xml 

             <TargetFramework>net6.0</TargetFramework>

          に書き換える．

        - ``roll-forward``を設定する．

          - 各プロジェクトファイルの``<PropertyGroup>…</PropertyGroup>``内に``<RollForward>Major</RollForward>`` を追加する．
            
          - あるいは実行時に引数として``--roll-forward Major``を渡す．

            - ``PROJECT.Gtk``や``PROJECT.Wpf``を実行する場合は
              ``dotnet run --project PROJECT.Gtk --roll-forward Major``や``dotnet run --project PROJECT.Wpf --roll-forward Major``などとする．
              
            - ``PROJECT.Mac``の場合は

              .. code:: 

                 open bin/Debug/net5.0/PROJECT.Mac.app --args --roll-forward Major

              などとするか，あるいは .app 内の実行ファイルに``--roll-forward Major``を引数として渡す．

        - .NET 5のランタイムをインストールする．`<https://dotnet.microsoft.com/ja-jp/download/dotnet/5.0>`_から入手可能．
          ただし， **.NET 5.0のサポートは2022/05/08に終了予定．**



=================
GTKのインストール
=================

オプショナル．Macだと``dotnet run``で実行できないのが面倒だし，遅かれ早かれ``brew``は入れることになると思うので，インストールするのがよいかもしれない．

Windows環境については情報収集中．

..
   ---------------------
   Windows（情報収集中）
   ---------------------

   https://www.gtk.org/docs/installations/windows/ によると，https://github.com/wingtk/gvsbuild の手順に従うことでインストールできるとある．
   しかし，私の環境では実際にインストールに成功したものの，上で ``dotnet run --project HelloEto.Gtk``をしても直ぐにプログラムが終了する模様．

---
Mac
---

1. `Homebrew <https://brew.sh/>`_ をトップページに書いてあることに従いインストールする． 
       
#. ターミナルから ``brew install gtk+3`` を実行する

   - ``brew update``も必要かもしれない
