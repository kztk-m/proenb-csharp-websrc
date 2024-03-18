-----
title: 第0回 環境構築2（C#演習用）
date:  2022-03-24
tableOfContents: true
-----

.. caution:: 

   `2024年8月一杯でVisual Studio for Macの提供が廃止される <https://learn.microsoft.com/en-us/visualstudio/mac/what-happened-to-vs-for-mac?view=vsmac-2022>`_ こととなった．
   それにともない，今年は
     Visual Studio Code上でC# Dev KitおよびIonide for F#
   を用いた環境構築法を紹介することとする．Visual Studio を使いたい人は `昨年度の環境構築法 <./setup_gui_2023.html>`_ を参照されたし．


.. role:: raw-html(raw)
   :format: html

C#演習第5・6回課題ではクロスプラットフォームGUIフレームワーク`Eto.Forms <https://github.com/picoe/Eto>`__を用いるので，その環境をセットアップする．
具体的な手順は「`コマンドライン環境の設定`_」を行った後，VSCode上で`動作確認`_を行う．

また，GTK用アプリケーションを作成したい人は`GTKのインストール`_を参照する（現状Mac環境のみ記載．Windows環境は情報収集中）．


.. （本ページに掲載されているスクリーンショットは，マイクロソフトの許諾を得て使用しています．）


========================
コマンドライン環境の設定
========================

ターミナル（WindowsだとPowerShell，Macだと"Terminal"や"iTerm2"など．VSCode内のターミナルでもよい）上で以下を実行する．

1. 以下のコマンドを実行する（設定自体はこれで終わり）．

   .. code:: 
 
      dotnet new install "Eto.Forms.Templates::*"

   .. note::

      2.8.0〜2.8.2には `テンプレートがコンパイルできない <https://github.com/picoe/Eto/issues/2619>`_ という不具合があるので，
      以前にテンプレートをインストールした人は上記によりテンプレートを更新する．

   

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

========
動作確認
========

#. Eto.Formsプロジェクトを作成し，VSCodeで開く．
   以下は「VSCodeでフォルダを開いた後に，VSCode内のターミナルからプロジェクト/ソリューションを作成する」
   流れを紹介しているが，`環境構築1 <./setup.html>`_ で紹介した通り
   「ターミナルで予めプロジェクト/ソリューションを作成し，その後VSCodeでソリューションを開く」
   を行ってもよい．

   i. 適当なフォルダ（``HelloEto``とする）を作成し，VSCodeでそのフォルダを開く．

   #. VSCode上のターミナル（メニューバーより「表示」→「ターミナル」あるいはJapanese Language Packを入れていないなら"View"→"Terminal"）
      を開き，以下のコマンドを実行する．``-sln``は不要だが，どうせC# Dev Kitが生成することになる．

      .. code:: 

         dotnet new etoapp -sln 

      その後``ls -F``（Windowsだと``dir``）してみると以下のようなフォルダおよびファイルが生成されたのがわかる（Windowsだと表示は異なるが作成されるフォルダ・ファイルは同じ）．

      .. code:: 

          $ ls -F 
          HelloEto/     HelloEto.Gtk/ HelloEto.Mac/ HelloEto.Wpf/ HelloEto.sln



#. ビルドおよび実行してみる．

   Windowsの場合は``HelloEto.Wpf``以下の``Program.cs``，Macの場合は``HelloEto.Mac``以下の``Program.cs``を
   開き（サイドバーからファイルを選択する）， エディタ **右上**（アクティビティーバーにあるアイコンではない）の「再生ボタンの右下に虫がついたアイコン」（デバッグ実行を表す）をクリックする．

   あるいは，VSCode上のターミナルから，Windowsの場合は

   .. code:: 

      dotnet run --project HelloEto.Wpf 

   を，Macの場合は

   .. code:: 

      (cd HelloEto.Mac && dotnet run) 

   を実行することでプログラムを通常実行する（``dotnet run --project HelloEto.Mac``では実行に失敗する）．

   はたまた，「実行とデバッグ」あるいは``F5``キーで（デバッグ）実行する場合は，やはり「デバッガーの選択」や「起動構成の選択」等について聞かれる．最初の質問には「C#」と回答したのでよいが，
   二個目の質問にはWindowsの場合は「HelloEto.Wpf」，Macの場合は「HelloEto.Mac」と回答する． `GTKのインストール`_を行っていれば「HelloEto.Gtk」を選んでもよい．

   いずれの場合もビルドは自動的に行われる．

   .. note::

      Mac環境だと``....Wpf``プロジェクトはビルドできない．Win環境だと``....Mac``はビルドできるが実行できない．

   * Windowsの場合の挙動

     i. しばらく待つと以下のようなウィンドウが表示される．
 
        .. image::images/ss_eto/etoapp_wpf.png 

     #. 「Click Me!」の部分をクリックするとダイアログが表示される．
     #. 実行を停止するには，上記ウィンドウの×ボタンを押せばよい．
        また，VSCodeの画面上部にデバッグ実行を制御するためのUIが表示されているので，□の形の停止っぽいボタンを押してもよい．

   * Macの場合の挙動

     i. しばらく待つと以下のようなウィンドウが表示される．

        .. image::images/ss_eto/mac_mac4.png 

     #. ツールバー上のボタン「Click Me!」は初期ウィンドウサイズだと隠れてしまっている．拡張して表示しよう．

        .. image::images/ss_eto/mac_mac5.png 

     #. 「Click Me!」の上の部分にマウスポインタを持ってくると，色が変わる部分があるのでそこをクリックするとダイアログが表示される．

        - 「Click Me!」自体はクリックできない．

        .. image::images/ss_eto/mac_mac6.png 

     #. デバッグ実行だと，Command + Qをを押したりメニューからQuitを選択したりしてもデバッグ実行自体は終了しない．
        VSCodeの画面上部にデバッグ実行を制御するためのUIが表示されているので，□の形の停止っぽいボタンを押す．
        
        ``dotnet run``等でデバッグ実行でなく通常の実行を行った場合は，Command + Q を押すか，メニューからQuitを選択してプログラムを終了することができる．
         
        .. important:: 

            ウィンドウ左上の閉じるボタンはプログラムを終了させない．この挙動はMacの一般的なアプリケーションプログラムと同様である．

=================
GTKのインストール
=================

オプショナル．

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

遅かれ早かれ``brew``は入れることになると思うので，そう手間は大きくないはず．


1. `Homebrew <https://brew.sh/>`_ をトップページに書いてあることに従いインストールする． 
       
#. ターミナルから ``brew install gtk+3`` を実行する

   - ``brew update``も必要かもしれない
