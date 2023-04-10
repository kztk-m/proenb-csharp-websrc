-----
title: 第0回 環境構築2（C#演習用）
date:  2022-03-24
tableOfContents: true
-----

.. role:: raw-html(raw)
   :format: html

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

1. Visual Studioを起動し，メニューバーが表示されている状態にする（たとえば，スタート画面から「コードなしで続行」する）．

   .. image::images/ss_eto/vs2022_win_start_without_initial_code.png 

#. メニューの「拡張機能」以下の「拡張機能の管理」を開く．

   .. image::images/ss_eto/vs2022_win_menu_extension.png
   
   すると拡張機能の管理ウィンドウが表示されるので，右上の検索窓から"Eto.Forms"を検索する．すると，"Eto.Forms. Templates and Previewer"がリストされるので，
   「ダウンロード」する．

   .. image::images/ss_eto/vs2022_win_search_eto_in_extension.png

   ..
      .. image::images/ss_eto/win3.png


#. すると，「変更内容がスケジュールされます。すべての Microsoft Visual Studio ウィンドウを閉じると変更が開始されます。」と
   表示されるので，一旦Visual Studioを終了させる．

#. その後，以下のウィンドウが表示されるので，「Modify」を選択する．

   .. image::images/ss_eto/vs2022_win_VSIX_installer.png


#. Visual Studioを再度立ち上げる．正しくインストールできていると，「新しいプロジェクト」作成時のテンプレート選択画面で「Eto.Forms Application」が選べるようになる．

   .. image::images/ss_eto/vs2022_win_template_selection_eto.png

   .. note::

      Visual Studio 2019 を既にインストールしてあった場合に，そのバージョンが古いままだとこのステップでエラーが出るようである．
      その場合はメニューの「ヘルプ」から「更新プログラムの確認」を確認して更新を実施する．
      

#. 動作確認ついでに「続行」からプロジェクトを作成してみよう．例のごとくプロジェクト名とソリューション名は適当でよい（``HelloEto``とする）．

   .. image::images/ss_eto/vs2022_win_creating_etoapp_project.png

   プロジェクト名とソリューション名を入力後，以下のウィンドウが表示される．ここでは，"Project"で"Separate per platform"を選択した場合の動作を説明する（"Combined"を選んでも支障はない）．

   .. image::images/ss_eto/vs2022_win_etoapp_properties.png


#. 作成すると，``HelloEto`` の他に ``HelloEto.Mac``，``HelloEto.Gtk``，``HelloEto.Wpf``というプロジェクトが作成されていることがわかる．
   演習では``HelloEto``（に相当するフォルダ）以下の``MainForm.cs``を編集することになる．
   ここでは，``HelloEto.Wpf``をビルド・実行する．（``HelloEto.Mac``はビルドできるがWindowsで実行できない．``HelloEto.Gtk``もビルドできるが実行にGTKのインストールが必要）．

   .. image::images/ss_eto/vs2022_win_etoapp_structure.png

#. ▶ボタンの左の枠から「HelloEto.Wpf」を選ぶ．

   .. image::images/ss_eto/vs2022_win_selecting_wpf_project.png

   選択後，右のソリューションエクプローラーで同プロジェクトが太字になる．

#. ▶ボタンを押すと，以下のウィンドウが表示される．

   .. image::images/ss_eto/vs2022_win_etoapp_window.png

#. いつものようなウィンドウタイトルや閉じるボタンが表示されていないように見えるかもしれないが，
   ウィンドウを拡大したらこれは隠れていただけであったことがわかる．黒いパネルはVisual Studio由来であり，実際にコマンドラインからビルド・実行すると表示されない．

   .. image::images/ss_eto/vs2022_win_etoapp_window_expanded.png

#. "Click Me!"と書かれた部分をクリックするとダイアログが表示される．

#. ウィンドウ右上の閉じるボタンか，Ctrl + Q を押すか，メニューからQuitを選択してプログラムを終了する．



-----
Mac編
-----



1. `Eto.Forms developper extensionsのリリースページ <https://github.com/picoe/Eto.DevExtensions/releases>`_ から，``Eto.DevExtension.VisualStudio.Mac.2022-X.X.X.mpack`` の最新版を入手する． 
   令和5年3月29日(水)時点での最新版は ``Eto.Addin.VisualStudio.Mac-2.7.1.mpack``．

#. メニューの「Visual Studio」以下の「拡張機能...」を開く．

   
   .. image::images/ss_eto/vs2022_mac_extension.png 

#. ウィンドウが出てくるので，「ファイルからインストール...」を選び，先程のダウンロードした.mackファイルを選択する．

#. すると，「次の拡張機能および関連する依存関係がインストールされます」と出てくるので，「インストール」をクリックしインストールする．

   .. image::images/ss_eto/vs2022_mac_extension_eto_installation.png 

#. Visual Studio を再起動する．

#. 正しくインストールできていると，「新しいプロジェクト」作成時のテンプレート選択画面で「マルチプラットフォーム」以下から「Eto Application」が選べるようになる．

   .. image::images/ss_eto/vs2022_mac_template_selection_eto.png

#. 動作確認ついでに「続行」からプロジェクトを作成してみよう．例のごとくプロジェクト名とソリューション名は適当でよい（``HelloEto``とする）．
   以下では"Project"は"Separate per platform"を選択した場合の動作を説明する（"Combined"を選んでも支障はない）．

   .. image::images/ss_eto/vs2022_mac_etoapp.png 
   .. image::images/ss_eto/vs2022_mac_etoapp_common_properties.png 

#. 作成すると，``HelloEto`` の他に ``HelloEto.Mac``，``HelloEto.Gtk``，``HelloEto.Wpf``というプロジェクトが作成されていることがわかる（"Separate per platform"を選択したため）．
   演習では``HelloEto``（に相当するフォルダ）以下の``MainForm.cs``を編集することになる．
   このうち，``HelloEto.Wpf``はMac版のVisual Studioではビルドできない．ここでは，動作確認のために``HelloEto.Mac``を（GTKをインストールするのであれば``HelloEto.Gtk``も）実行してみよう．

   .. image::images/ss_eto/vs2022_mac_etoapp_structure.png 

   * "Project"で"combined"を選択すると作成されるプロジェクトはそのプラットフォーム向けのもののみとなる． 

   - `HelloEto.Mac`

     i. ▶ボタンの右に「HelloEto.Mac」が表示されていなければ，その部分をクリックして「HelloEto.Mac」を選択する．左の「ソリューション」の部分で，プロジェクト名「HelloEto.Mac」が太字になっていることを確認する．

        ..
           .. image::images/ss_eto/mac_mac1.png 

     #. ここで「▶」を押したくなるのだが，このままでは実行に失敗するため設定が必要になる．
             
        .. note:: 

           `生成された実行形式を起動するには，生成された.appファイルをopenするか，その中の実行ファイルを実行する必要がある <https://github.com/picoe/Eto/wiki/Quick-Start#visual-studio-for-mac-86>`_ ．
           この点は ``dotnet`` を用いる場合でも同様である．

     #. 左の「ソリューション」の ``HelloEto.Mac`` の部分をダブルクリックすると，プロジェクトオプション編集用ウィンドウが表示される．
        「実行」>「構成」>「Default」の項目から，「開始アクション」の「外部プログラムの開始」を選択し入力欄に以下を入力する（.appの中身なので，「...」ボタンからは選択できない）

        .. code:: 
            
            ~/Projects/HelloEto/HelloEto/HelloEto.Mac/bin/Debug/net6.0/HelloEto.Mac.app/Contents/MacOS/HelloEto.Mac

        ここで，``~/Projects/HelloEto/HelloEto/HelloEto.Mac``の部分は``HelloEto.Mac``フォルダへの絶対パスとする．"HelloEto"の部分は自分で設定したプロジェクト名とする（ソリューション名をプロジェクト名と別にした場合は外側の``HelloEto``の部分が自分で設定したソリューション名）．

        .. image::images/ss_eto/vs2022_mac_path_to_program.png

        この変更は``HelloEto.Mac.csproj.user``ファイルに書き込まれるため，プロジェクトにつき一回行うのみでよい．           

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

       dotnet new list eto


   .. note::

      ``dotnet``のバージョンによっては，``dotnet new -l eto``や``dotnet new eto -l``のように書かなけれならないかもしれない．

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
   
          dotnet new etoapp 

      その後``ls``してみると以下のようなディレクトリが生成されたのがわかる（Windowsだと``ls``は``dir``の別名なので表示は異なる）．

      .. code:: 

          $ ls 
          HelloEto/     HelloEto.Gtk/ HelloEto.Mac/ HelloEto.Wpf/

      * ソリューションも作成したい場合は``dotnet new etoapp -sln``とする．
      * プラットフォーム毎にプロジェクトを作成したくない場合は代わりに``dotnet new etoapp -c``とする．

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

       その後，以下のコマンドでビルドしたプログラムを実行する．

       .. code::

           (cd HelloEto.Mac && dotnet run)
      
       .. caution:: 

          ``dotnet run --project HelloEto.Mac`` では実行に失敗する．:raw-html:`<del>どうやら作業ディレクトリがHelloEto.Macであることが重要である模様．</del><ins>2022-04-22追記：.csprojにてRunWorkingDirectoryをセットしてもうまくいなかいので，原因はそう単純じゃなさそう．</ins>`

       .. caution::

         括弧は大事．以下のコマンドでは実行後に現在のディレクトリが``HelloEto.Mac``に変わってしまう．

         .. code::

            cd HelloEto.Mac && dotnet run


       .. note::

         以下のコマンドでもプログラムを実行可能．

         .. code::

             open HelloEto.Mac/bin/Debug/net6.0/HelloEto.Mac.app

         ``.net6.0``の部分はターゲットフレームワークによって変わる．

       .. note:: 

         ``dotnet new etoapp -c``でプラットフォーム共通のプロジェクトを作成した場合は，``dotnet build``でビルドでき``dotnet run``で作成したプログラムを実行できる．コマンドラインから直接ビルド・実行を行う場合はこちらのほうが楽かもしれない．

       .. note::
          
          Windows環境だと，.Mac版はビルドできるが実行できない．

     - GTKがインストールされているのならば（参考：`GTKのインストール`_），GTK版をビルド・実行してみるのもよい．
       まず，以下を実行しビルドする．

       .. code:: 

          dotnet build HelloEto.Gtk

       つぎに，以下を実行しビルドしたプログラムを実行する．

       .. code::

          dotnet run --project HelloEto.Gtk


   ..   .. note::

   ..      Visual Studio 2019 で作成したプロジェクトを実行するときなど，ターゲットフレームワークが .NET 5.0 になっている
   ..      にもかかわらず，.NET 5 のランタイムがインストールされていない場合はいかのいずれかを実行する．

   ..      - ターゲットフレームワークを .NET 6.0 に変更する．具体的には各プロジェクトファイル（拡張子：.csproj）の

   ..        .. code:: xml

   ..           <TargetFramework>net5.0</TargetFramework>

   ..        となっている部分を

   ..        .. code:: xml 

   ..           <TargetFramework>net6.0</TargetFramework>

   ..        に書き換える．

   ..      - ``roll-forward``を設定する．

   ..        - 各プロジェクトファイルの``<PropertyGroup>…</PropertyGroup>``内に``<RollForward>Major</RollForward>`` を追加する．
            
   ..        - あるいは実行時に引数として``--roll-forward Major``を渡す．

   ..          - ``PROJECT.Gtk``や``PROJECT.Wpf``を実行する場合は
   ..            ``dotnet run --project PROJECT.Gtk --roll-forward Major``や``dotnet run --project PROJECT.Wpf --roll-forward Major``などとする．
              
   ..          - ``PROJECT.Mac``の場合は

   ..            .. code:: 

   ..               open bin/Debug/net5.0/PROJECT.Mac.app --args --roll-forward Major

   ..            などとするか，あるいは .app 内の実行ファイルに``--roll-forward Major``を引数として渡す．

   ..      - .NET 5のランタイムをインストールする．`<https://dotnet.microsoft.com/ja-jp/download/dotnet/5.0>`_から入手可能．
   ..        ただし， **.NET 5.0のサポートは2022/05/08に終了予定．**

.. note::

   なお，"Eto.Forms"のVisual Studioの拡張機能によってできることは``dotnet new etoapp``相当である．
   なので，なんらかの理由で拡張機能が正常に動かない場合にも，コマンドラインでしなければならないのは，
   ``dotnet new etoapp``（と必要に応じてソリューションの作成と，それへのプロジェクトの追加）のみである．

   たとえば，``HelloEto``の場合を例にとると，Visual Studioで``HelloEto/HelloEto.csproj``というプロジェクトを開き，
   そこに``HelloEto.Wpf/HelloEto.Wpf.csproj``等のプロジェクトを追加すればよい（メニューからそういう項目が選べる）．

   また，それではまだ面倒くさいという人はソリューションを作成すればよい．今，上記手順で作成したディレクトリに移動したとする．
   （``ls``すると以下のように表示されるところ）．

   .. code:: 

      $ ls 
      HelloEto/     HelloEto.Gtk/ HelloEto.Mac/ HelloEto.Wpf/

   すると，その場所で

   .. code::

      dotnet new sln 

   とすると，ソリューションファイル（``HelloEto.sln``という名前になるはず）が作成される．その後
   以下の各行を実行すれば（正確には自分のプラットフォームに関係ないプロジェクトについてはソリューションに追加しなくてよい），
   作成したソリューションファイルをVisual Studioで開くことにより，これらのプロジェクトをまとめて開くことができる．

   .. code::

      dotnet sln add HelloEto
      dotnet sln add HelloEto.Gtk
      dotnet sln add HelloEto.Mac
      dotnet sln add HelloEto.Wpf
   
   
   


=================
GTKのインストール
=================

オプショナル．MacだとVisual Studio上での実行に設定が必要になるのは面倒だし，インストールするのもよいかもしれない．遅かれ早かれ``brew``は入れることになると思うので，そう手間は大きくないはず．

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
