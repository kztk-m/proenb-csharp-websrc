-----
title: 環境構築（Eto.Formsの設定）
date:  2022-03-23
tableOfContents: true
-----

===================
Visual Studioの設定
===================

---------
Windows編
---------




-----
Mac編
-----



1. `Eto.Fromのリリースページ <https://github.com/picoe/Eto/releases>`_ から，Eto.Addin.VisualStudio.….mpackの最新版を入手する． 
   令和4年3月23日(水)時点での最新版は ``Eto.Addin.VisualStudio.Mac-2.6.1.mpack``．

#. メニューの「Visual Studio」以下の「Extensions...」（ローカライズが完了していたら「拡張機能...」かも）を開く．

   .. image::images/ss_eto_mac1.png

#. ウィンドウが出てくるので，「ファイルからインストール...」を選び，先程のダウンロードした.mackファイルを選択する．

   .. image::images/ss_eto_mac2.png

#. すると，「次のパッケージがインストールされます」と出てくるので，「install」をクリックしインストールする．

   .. image::images/ss_eto_mac3.png

#. Visual Studio を再起動する．

#. 正しくインストールできていると，「新しいプロジェクト」作成時のテンプレート選択画面で「Eto Application」が選べるようになる．

   .. image::images/ss_eto_mac4.png

#. 動作確認ついでに「続行」からプロジェクトを作成してみよう．例のごとくプロジェクト名とソリューション名は適当でよい（``HelloEto``とする）．

#. 作成すると，``HelloEto`` の他に ``HelloEto.Mac``，``HelloEto.Gtk``，``HelloEto.Wpf``というプロジェクトが作成されていることがわかる．
   演習では``HelloEto``（に相当するフォルダ）以下の``MainForm.cs``を編集することになる．
   このうち，``HelloEto.Wpf``はMac版のVisual Studioではビルドできない．ここでは，動作確認のために``HelloEto.Gtk``と``HelloEto.Mac``を実行してみよう．

   .. image::images/ss_eto_mac6.png

   - `HelloEto.Gtk`
  
     i. GTKをインストールする（参考：`GTKのインストール`_）

     #. ▶ボタンの右に ``HelloEto.Gtk`` が表示されていることを確認する．そうでなければ，その部分をクリックして ``HelloEto.Gtk`` を選択する．
        左の「ソリューション」の部分で，プロジェクト名``HelloEto.Gtk`` が太字になっていることを確認する．
        
        .. image::images/ss_eto_mac_gtk1.png

     #. しばらく待つと，Dockから以下のアイコンのアプケーションが起動していることが確認できるので，アイコンをクリックするなりしてフォーカスをそのアプリケーションに写す．

        .. image::images/ss_eto_mac_gtk2.png

     #. 以下のようなウィンドゥが表示される．

        .. image::images/ss_eto_mac_gtk3.png

     #. "Click Me!"と書かれたボタンをクリックするとダイアログが表示される．

     #. ウィンドウ左上の閉じるボタンか，Ctrl + Q を押すか，メニューからQuitを選択してプログラムを終了する．

   - `HelloEto.Mac`

     i. ▶ボタンの右に ``HelloEto.Mac`` が表示されていなければ，その部分をクリックして ``HelloEto.Mac`` を選択する．左の「ソリューション」の部分で，プロジェクト名``HelloEto.Mac``が太字になっていることを確認する．

        .. image::images/ss_eto_mac_mac1.png 

     #. ここで，▶ボタンがかなづちボタンになっていることに気付くかもしれない．これは，Visual Studioはビルドしかせず，
        実行してくれないことを表している．実行するには設定が必要になる．
   
        .. note:: 

           `生成された実行形式を起動するには，生成された.appファイルをopenするか，その中の実行ファイルを実行する必要がある <https://github.com/picoe/Eto/wiki/Quick-Start#visual-studio-for-mac-86>`_ ．
           この点は ``dotnet`` を用いる場合でも同様である．

     #. 左の「ソリューション」の ``HelloEto.Mac`` の部分をダブルクリックすると，プロジェクトオプション編集用ウィンドウが表示される．
        「実行」>「構成」>「Default」の項目から，「開始アクション」の「外部プログラムの開始」に以下を入力する（.appの中身なので，「...」ボタンからは選択できない）．

        .. code:: 
            
            bin/Debug/net5.0/HelloEto.Mac.app/Contents/MacOS/HelloEto.Mac

        この変更は一回行うのみでよい．

     #. しばらく待つと，Dockから以下のアイコンのアプケーションが起動していることが確認できるので，アイコンをクリックするなりしてフォーカスをそのアプリケーションに写す．

        .. image::images/ss_eto_mac_mac3.png 

     #. 以下のようなウィンドゥが表示される．

        .. image::images/ss_eto_mac_mac4.png 

     #. GTK版とは異なり，「Click Me!」は初期ウィンドゥサイズだと隠れてしまっている．拡張して表示しよう．

        .. image::images/ss_eto_mac_mac5.png 

     #. 「Click Me!」の上の部分にマウスポインタを持ってくると，色が変わる部分があるのでそこをクリックするとダイアログが表示される．

        .. image::images/ss_eto_mac_mac6.png 

     #. Command + Q を押すか，メニューからQuitを選択してプログラムを終了する．
         
        .. caution:: 

            ウィンドウ左上の閉じるボタンはプログラムを終了させない．この挙動はMacの一般的なアプリケーションプログラムと同様である．



========================
コマンドライン環境の設定
========================

WindowsだとPowerShell，Macだと適当な仮想端末アプリケーション（Terminal.app）を使って以下を実行する．

1. 以下を行う（設定自体はこれで終わり）．

   .. code:: bash 
 
       $ dotnet new -i "Eto.Forms.Templates::*"

#. 確認のために ``dotnet new -l eto`` を実行してみる．

   .. code:: bash 

       $ dotnet new -l eto
       これらのテンプレートは、入力: 'eto' と一致しました
       
       テンプレート名             短い名前  言語        タグ
       -------------------------  --------  ----------  ------------------
       Eto Application            etoapp    [C#],F#,VB  Cross Platform/Eto
       Eto Panel, Dialog or Form  etofile   [C#],F#,VB  Cross Platform/Eto

#. 動作確認

   i. 適当なディレクトリに移動し，適当な名前のディレクトリを作成する（``HelloEto``とする）

      .. code:: bash 

          $ mkdir HelloEto 
          $ cd HelloEto 

   #. ``dotnet new etoapp -f net6.0`` を実行する．

      .. code:: bash 
   
          $ dotnet new etoapp -f net6.0
          テンプレート "Eto Application" が正常に作成されました。
          $ ls 
          HelloEto/     HelloEto.Gtk/ HelloEto.Mac/ HelloEto.Wpf/

  #. buildおよび実行してみる．

     - GTKがインストールされているのならば（Win/Mac共通．参考：`GTKのインストール`_）

       .. code:: bash 

           $ dotnet build HelloEto.Gtk
           （中略）
           $ dotnet run --project HelloEto.Gtk

       とするとアプリケーションが起動する．

     - Windowsだと

       .. code:: bash 
     
           $ dotnet build HelloEto.Wpf
           （中略）
           $ dotnet run --project HelloEto.Wpf

     - Macだと

       .. code:: bash 

           $ dotnet build HelloEto.Mac
           （中略）
           $ open HelloEto.Mac/bin/Debug/net6.0/HelloEto.Mac.app


=================
GTKのインストール
=================

オプショナル・推奨

Macだと``dotnet run``で実行できないのが面倒だし，遅かれ早かれ``brew``は入れることになると思うので，インストールするのがよいかもしれない．

-------
Windows
-------


---
Mac
---

1. `Homebrew <https://brew.sh/>`_ をトップページに書いてあることに従いインストールする． 
       
#. ターミナルから ``brew install gtk+3`` を実行する

   - ``brew update``も必要かもしれない
