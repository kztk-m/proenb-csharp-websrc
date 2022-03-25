-----
title: 環境構築（Eto.Formsの設定）
date:  2022-03-24
tableOfContents: true
-----

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
   
   以下のようなウィンドウが表示される．

   .. image::images/ss_eto/win3.png


#. 右上の検索窓から"Eto.Forms"を検索する．すると，"Eto.Froms Visual Studio Addin"がリストされるので，
   「ダウンロード」する．

   .. image::images/ss_eto/win4.png

   すると，「変更内容がスケージュールされます。すべての Microsoft Visual Studio ウィンドウを閉じると変更が開始されます。」と
   表示されるので，一旦Visual Studioを終了させる．

#. その後，以下のウィンドウが表示されるので，「Modify」を選択する．

   .. image::images/ss_eto/win5.png


#. Visual Studioを再度立ち上げる．正しくインストールできていると，「新しいプロジェクト」作成時のテンプレート選択画面で「Eto.Forms Application」が選べるようになる．

   .. image::images/ss_eto/win6.png

#. 動作確認ついでに「続行」からプロジェクトを作成してみよう．例のごとくプロジェクト名とソリューション名は適当でよい（``HelloEto``とする）．

   .. image::images/ss_eto/win7.png

   プロジェクト名とソリューション名を入力後，以下のウィンドウが表示されるがこれは何も変更しなくてよい．

   .. image::images/ss_eto/win8.png


#. 作成すると，HelloEto の他に HelloEto.Mac，HelloEto.Gtk，HelloEto.Wpfというプロジェクトが作成されていることがわかる．
   演習ではHelloEto（に相当するフォルダ）以下のMainForm.csを編集することになる．
   ここでは，HelloEto.Wpfをビルド・実行する．（HelloEto.MacはビルドできるがWindowsで実行できない．HelloEto.Gtkもビルドできるが実行にGTKのインストールが必要）．

   .. image::images/ss_eto/win9.png


#. ▶ボタンの左の枠から「HelloEto.Wpf」を選ぶ．右のソリューションエクプローラーで同プロジェクトが太字になっていることを確認する．

   .. image::images/ss_eto/win_wpf1.png


#. ▶ボタンを押すと，以下のウィンドウが表示される．

   .. image::images/ss_eto/win_wpf2.png

#. いつもウィンドウタイトルや閉じるボタンが表示されていないように見えるかもしれないが，
   ウィンドウを拡大したら隠れていただけであったことがわかる．黒いパネルはVisual Studio由来であり，実際にコマンドラインからビルド・実行すると表示されない．

   .. image::images/ss_eto/win_wpf3.png

#. "Click Me!"と書かれた部分をクリックするとダイアログが表示される．

#. ウィンドウ右上の閉じるボタンか，Ctrl + Q を押すか，メニューからQuitを選択してプログラムを終了する．



-----
Mac編
-----



1. `Eto.Fromのリリースページ <https://github.com/picoe/Eto/releases>`_ から，Eto.Addin.VisualStudio.….mpackの最新版を入手する． 
   令和4年3月23日(水)時点での最新版は ``Eto.Addin.VisualStudio.Mac-2.6.1.mpack``．

#. メニューの「Visual Studio」以下の「Extensions...」（ローカライズが完了していたら「拡張機能...」かも）を開く．

   .. image::images/ss_eto/mac1.png

#. ウィンドウが出てくるので，「ファイルからインストール...」を選び，先程のダウンロードした.mackファイルを選択する．

   .. image::images/ss_eto/mac2.png

#. すると，「次のパッケージがインストールされます」と出てくるので，「install」をクリックしインストールする．

   .. image::images/ss_eto/mac3.png

#. Visual Studio を再起動する．

#. 正しくインストールできていると，「新しいプロジェクト」作成時のテンプレート選択画面で「Eto Application」が選べるようになる．

   .. image::images/ss_eto/mac4.png

#. 動作確認ついでに「続行」からプロジェクトを作成してみよう．例のごとくプロジェクト名とソリューション名は適当でよい（``HelloEto``とする）．

#. 作成すると，HelloEto の他に HelloEto.Mac，HelloEto.Gtk，HelloEto.Wpfというプロジェクトが作成されていることがわかる．
   演習ではHelloEto（に相当するフォルダ）以下のMainForm.csを編集することになる．
   このうち，HelloEto.WpfはMac版のVisual Studioではビルドできない．ここでは，動作確認のためにHelloEto.GtkとHelloEto.Macを実行してみよう．

   .. image::images/ss_eto/mac6.png

   - `HelloEto.Mac`

     i. ▶ボタンの右に「HelloEto.Mac」が表示されていなければ，その部分をクリックして「HelloEto.Mac」を選択する．左の「ソリューション」の部分で，プロジェクト名「HelloEto.Mac」が太字になっていることを確認する．

        .. image::images/ss_eto/mac_mac1.png 

     #. ここで，▶ボタンがかなづちボタンになっていることに気付くかもしれない．これは，Visual Studioはビルドしかせず，
        実行してくれないことを表している．実行するには設定が必要になる．
   
        .. note:: 

           `生成された実行形式を起動するには，生成された.appファイルをopenするか，その中の実行ファイルを実行する必要がある <https://github.com/picoe/Eto/wiki/Quick-Start#visual-studio-for-mac-86>`_ ．
           この点は ``dotnet`` を用いる場合でも同様である．

     #. 左の「ソリューション」の ``HelloEto.Mac`` の部分をダブルクリックすると，プロジェクトオプション編集用ウィンドウが表示される．
        「実行」>「構成」>「Default」の項目から，「開始アクション」の「外部プログラムの開始」に以下を入力する（.appの中身なので，「...」ボタンからは選択できない）．

        .. code:: 
            
            bin/Debug/net5.0/HelloEto.Mac.app/Contents/MacOS/HelloEto.Mac

        .. image::images/ss_eto/mac_mac2.png

        この変更は一回行うのみでよい．

     #. しばらく待つと，Dockから以下のアイコンのアプケーションが起動していることが確認できるので，アイコンをクリックするなりしてフォーカスをそのアプリケーションに写す．

        .. image::images/ss_eto/mac_mac3.png 

     #. 以下のようなウィンドゥが表示される．

        .. image::images/ss_eto/mac_mac4.png 

     #. GTK版とは異なり，「Click Me!」は初期ウィンドゥサイズだと隠れてしまっている．拡張して表示しよう．

        .. image::images/ss_eto/mac_mac5.png 

     #. 「Click Me!」の上の部分にマウスポインタを持ってくると，色が変わる部分があるのでそこをクリックするとダイアログが表示される．

        .. image::images/ss_eto/mac_mac6.png 

     #. Command + Q を押すか，メニューからQuitを選択してプログラムを終了する．
         
        .. caution:: 

            ウィンドウ左上の閉じるボタンはプログラムを終了させない．この挙動はMacの一般的なアプリケーションプログラムと同様である．

   - `HelloEto.Gtk`
  
     i. GTKをインストールする（参考：`GTKのインストール`_）

     #. ▶ボタンの右に「HelloEto.Gtk」が表示されていることを確認する．そうでなければ，その部分をクリックして「HelloEto.Gtk」を選択する．
        左の「ソリューション」の部分で，プロジェクト名``HelloEto.Gtk`` が太字になっていることを確認する．
        
        .. image::images/ss_eto/mac_gtk1.png

     #. しばらく待つと，Dockから以下のアイコンのアプケーションが起動していることが確認できるので，アイコンをクリックするなりしてフォーカスをそのアプリケーションに写す．

        .. image::images/ss_eto/mac_gtk2.png

     #. 以下のようなウィンドゥが表示される．

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

   #. 以下を実行するを実行する．      

      .. code:: 
   
          dotnet new etoapp 

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
